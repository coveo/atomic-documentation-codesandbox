require 'json'
require 'nokogiri'
class UpdatePackage

    def initialize(version)
      @version = version
      @package = JSON.parse(File.read('../../package.json'))
      @index_page = Nokogiri::HTML(File.open("../../index.html"))
    end

    def write
        update_title_version(@package, @version)
        update_index_page

    end

    private

    def update_title_version(package, version)
        new_package = package
        new_package['name'] = "coveo-atomic-#{version.gsub(/[.-]/, '')}"
        File.write('../../package.json', JSON.pretty_generate(new_package))
    end

    def update_index_page
      version_stripped = @version.gsub(/(\d+\.)(\d+)(\.\d+)/,'v\1\2' )
      doc = @index_page
      script_cdn = doc.xpath("//script").first
      stylesheet = doc.xpath("//link").first
      script_cdn['src'] = "https://static.cloud.coveo.com/atomic/" + "#{version_stripped}" + "/atomic.esm.js"
      # at the time of making this, stylesheets are not being versioned in CDN so latest is always safest bet
      stylesheet['href'] = "https://static.cloud.coveo.com/atomic/latest/themes/default.css"
      doc.xpath("//script").each do |script|
        if script.to_s == '<script nomodule src="/build/atomic.js"></script>'
          script.remove
        end
      end
      doc.to_html
      File.write("../../index.html", doc)
    end

end

def main
  if ARGV.length != 1
    puts 'USAGE: ruby update_package.rb [version]'
    exit 1
  end
  UpdatePackage.new(ARGV[0]).write
end
main
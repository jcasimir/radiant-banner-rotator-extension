class BannerRotatorExtension < Radiant::Extension
  version "1.1"
  description "Allows addition and independent management of rotating banners on pages."
  url "http://github.com/avonderluft/radiant-concurrent_draft-extension/tree/master"

  def activate
    Page.send :include, BannerRotator::PageExtensions
    Page.send :include, BannerRotator::Tags

    tab 'Content' do
      add_item "Banners", '/admin/banners', :after => "Pages", :visibility => [:admin, :developer]
    end
    #admin.pages.edit.add :extended_metadata, 'show_banner_meta'
    
    # Radiant::AdminUI.class_eval do
    #   attr_accessor :banner
    #   alias_method "banners", :banner
    # end
    # admin.banner = load_default_banner_regions
  end
  
  def deactivate
    # admin.tabs.remove "Banners"
  end
  
  def load_default_banner_regions
    returning OpenStruct.new do |banner|
      banner.index = Radiant::AdminUI::RegionSet.new do |index|
        index.top.concat %w{}
        index.bottom.concat %w{}
      end
    end
  end

  
end
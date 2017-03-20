module DefaultPageContent
   extend ActiveSupport::Concern

  include do
    before_filter :set_page_defaults
  end

  def set_page_defaults
    @page_title   = "Portfolio"
    @seo_keywords = "Igor Melao portfolio"
  end
end


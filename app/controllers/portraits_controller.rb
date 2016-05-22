class PortraitsController < ApplicationController
  def new
    @portrait = Portrait.new
  end

  def create
    portrait = manipulate(params[:portrait])

    send_data(portrait,
              :filename => "portrait.png",
              :quality => 100,
              :type => 'image/png'
             )
  end

  def entries
    @entries = Entry.all
  end
  private

    def set_portrait
      @portrait = Portrait.find(params[:id])
    end

    def portrait_params
      params.fetch(:portrait, {})
    end

    def manipulate(obj)
      portrait_banner = obtain_banner
      portrait_file = create_portrait_file(obj)
      portrait_file.gravity = Magick::SouthEastGravity
      portrait = portrait_file.composite_layers(portrait_banner, Magick::OverCompositeOp)
      parse_portrait(portrait)
    end

    def obtain_banner
      Magick::ImageList.new('app/assets/images/imutn.png')
    end

    def create_portrait_file(obj)
      Magick::ImageList.new(File.new(obj[:portrait_image].tempfile))
    end

    def parse_portrait(portrait_file)
      portrait_file.to_blob { |attrs| attrs.format = 'png' }
    end
end

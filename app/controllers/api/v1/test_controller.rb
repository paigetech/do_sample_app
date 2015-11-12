class Api::V1::TestController < ApplicationController
  respond_to :json

  def index
    respond_with "test controller"
  end

  def create

    event_submit(params[:json_event])

    respond_to do |format|
      if ( @log.present? )
        format.json { render text: "Log: " + @log }
      else
        format.json { render text: "Error, no log" }
      end
    end

  end

  def nul_check(param)
    param ||= "none"
    return param
  end


  def event_submit(params)

    @log = ""

    #initialize the log
    @log = ""
    #set the browser that we will use to chrome for testing
    #use headless
    headless = Headless.new
    headless.start

    browser = Watir::browser.start 'www.google.com'

    @log += browser.title

  end

end

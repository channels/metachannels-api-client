require 'wrest'

Wrest::Components::Translators::CONTENT_TYPES["application/opensearchdescription+xml"] = Wrest::Components::Translators::Xml

class MetachannelsApi
  DEFAULT_API_ENDPOINT = "http://api.metachannels.com/api" unless defined?(DEFAULT_API_ENDPOINT)
  attr_accessor :api_key
  attr_accessor :end_point

  def initialize(apikey = nil, end_point = nil)
    @api_key = apikey
    @end_point = end_point || DEFAULT_API_ENDPOINT
  end

  # Invoke the Metachannels Search API
  # Pass the same parameters as the Search API as a hash.
  # See http://support.metachannels.com/entries/321559-metachannels-api-beta-0-2
  # args:
  #     *searchTerms*
  #     *perPage*
  #     *startPage*
  #     *order*
  #     *types*
  def search(*args)
    raise ArgumentError.new('apikey not specified') if @api_key.blank?
    parameters = args.extract_options!

    uri()['/search'].get(parameters, {'Channels-Authorization' => @api_key}).deserialise
  end

  # args:
  #     *username*
  #     *perPage*
  #     *startPage*
  #     *format*
  # Example: http://www.channels.com/api/shows/youtube?username=senatorfeinstein&format=xml&perPage=1&startPage=1
  def search_youtube(*args)
    raise ArgumentError.new('apikey not specified') if @api_key.blank?
    parameters = args.extract_options!

    uri()['/shows/youtube'].get(parameters, {'Channels-Authorization' => @api_key}).deserialise
  end

  # Invoke the MetaChannels Shows API to retreive a single show
  # *id*    The id of the metachannels show
  # *args*  TBD
  def show(id, *args) #TODO rename as get_show, alias
    raise ArgumentError.new('apikey not specified') if @api_key.blank?
    parameters = args.extract_options!

    uri()["/shows/#{id}"].get(parameters, {'Channels-Authorization' => @api_key}).deserialise
  end

  def get_video(id, *args)
    raise ArgumentError.new('apikey not specified') if @api_key.blank?
    parameters = args.extract_options!
    parameters[:format]="json"      #make request json type
    uri()["/videos/#{id}"].get(parameters, {'Channels-Authorization' => @api_key}).deserialise
  end

  # Invoke the MetaChannels Shows API to create a show
  # args  {:showLoc="YouTube", :youtubetype=>"YoutubePlaylist", :ytchannelorplaylist=>"abc", :email=>"xiaoming.lu.backup@gmail.com", callbackurl=>"http://24.6.103.116:3001/notify_addshow"}
  def create_show(*args)
    raise ArgumentError.new('apikey not specified') if @api_key.blank?
    parameters = args.extract_options!
    parameters[:api_key]=@api_key
    parameters[:format]="json"      #make request json type

    uri['/shows'].post_form(parameters, {'Channels-Authorization' => @api_key})
  end

  # Retreive the set of all Wurl Packages
  # GET /api/wurl_packages
  def wurl_packages(*args)
    raise ArgumentError.new('apikey not specified') if @api_key.blank?
    parameters = args.extract_options!

    uri()['/wurl_packages'].get(parameters, {'Channels-Authorization' => @api_key}).deserialise
  end

  # Retrieve a single Wurl Package
  # GET /api/wurl_package
  def get_wurl_package(slug, *args)
    raise ArgumentError.new('apikey not specified') if @api_key.blank?
    parameters = args.extract_options!

    uri()["/wurl_packages/#{slug}"].get(parameters, {'Channels-Authorization' => @api_key}).deserialise
  end

  private
  def uri
    @end_point.to_uri()
  end
end

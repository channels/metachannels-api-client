require 'wrest'

Wrest::Components::Translators::CONTENT_TYPES["application/opensearchdescription+xml"] = Wrest::Components::Translators::Xml

class MetachannelsApi
  DEFAULT_API_ENDPOINT = "http://api.metachannels.com/api"
  attr_accessor :api_key
  attr_accessor :end_point

  def initialize(apikey = nil, end_point = nil)
    @api_key = apikey
    @end_point = end_point || "http://api.metachannels.com/api"
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

  # Invoke the MetaChannels Shows API to retreive a single show
  # *id*    The id of the metachannels show
  # *args*  TBD
  def show(id, *args) #TODO rename as get_show, alias
    raise ArgumentError.new('apikey not specified') if @api_key.blank?
    parameters = args.extract_options!

    uri()["/shows/#{id}"].get(parameters, {'Channels-Authorization' => @api_key}).deserialise
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

  private
  def uri
    @end_point.to_uri()
  end
end
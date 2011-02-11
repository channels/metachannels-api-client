require 'wrest'

Wrest::Components::Translators::CONTENT_TYPES["application/opensearchdescription+xml"] = Wrest::Components::Translators::Xml

class MetachannelsApi
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
  def show(id, *args)
    raise ArgumentError.new('apikey not specified') if @api_key.blank?
    parameters = args.extract_options!

    uri()["/shows/#{id}"].get(parameters, {'Channels-Authorization' => @api_key}).deserialise
  end

  private
  def uri
    @end_point.to_uri()
  end
end


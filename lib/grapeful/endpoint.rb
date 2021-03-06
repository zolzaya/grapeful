module Grapeful
  module Endpoint

    def ful(*args)
      options = args.count > 1 ? args.extract_options! : {}
      key, object = if args.count == 2 && args.first.is_a?(Symbol)
                      args
                    else
                      [nil, args.first]
                    end
      @data ||= Hash.new
      @data[key] = object if key
      @data.merge!(options)
      body @data
    end
  end
end

Grape::Endpoint.send(:include, Grapeful::Endpoint)

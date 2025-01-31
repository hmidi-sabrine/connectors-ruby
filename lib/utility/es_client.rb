#
# Copyright Elasticsearch B.V. and/or licensed to Elasticsearch B.V. under one
# or more contributor license agreements. Licensed under the Elastic License;
# you may not use this file except in compliance with the Elastic License.
#

# frozen_string_literal: true

require 'logger'
require 'elasticsearch'

module Utility
  class EsClient < ::Elasticsearch::Client
    class IndexingFailedError < StandardError
      def initialize(message, error = nil)
        super(message)
        @cause = error
      end

      attr_reader :cause
    end

    def initialize(es_config)
      super(connection_configs(es_config))
    end

    def connection_configs(es_config)
      configs = { :api_key => es_config[:api_key] }
      if es_config[:cloud_id]
        configs[:cloud_id] = es_config[:cloud_id]
      elsif es_config[:hosts]
        configs[:hosts] = es_config[:hosts]
      else
        raise 'Either elasticsearch.cloud_id or elasticsearch.hosts should be configured.'
      end
      configs[:log] = es_config[:log] || false
      configs[:trace] = es_config[:trace] || false

      # if log or trace is activated, we use the application logger
      configs[:logger] = if configs[:log] || configs[:trace]
                           Utility::Logger.logger
                         else
                           # silence!
                           ::Logger.new(IO::NULL)
                         end
      configs
    end

    def bulk(arguments = {})
      raise_if_necessary(super(arguments))
    end

    private

    def raise_if_necessary(response)
      if response['errors']
        first_error = response['items'][0]
        raise IndexingFailedError.new("Failed to index documents into Elasticsearch.\nFirst error in response is: #{first_error.to_json}")
      end
      response
    end
  end
end

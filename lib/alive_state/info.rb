module AliveState
  module Info
    class << self
      def version
        @version ||= read_file
      end

      def reversion
        @reversion ||= read_git
      end

      def version_format
        [self.version, self.reversion].join(' ').strip
      end

      private
        def read_file
          File.read(AliveState.config.version).strip
        rescue
          ''
        end

        def read_git
          raw = ''
          cmd = 'git log --pretty=format:%h -n 1'
          IO.popen(cmd, 'r') do |stdout|
            stdout.each do |row|
              raw << row
            end
          end
          raw.chomp
        rescue
          ''
        end
      # end private
    end
  end
end

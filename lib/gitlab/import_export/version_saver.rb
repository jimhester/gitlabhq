module Gitlab
  module ImportExport
    class VersionSaver

      def initialize(shared:)
        @shared = shared
      end

      def save
        FileUtils.mkdir_p(@shared.export_path)

        File.write(version_file, Gitlab::ImportExport.version, mode: 'w')
      rescue => e
        @shared.error(e)
        false
      end

      private

      def version_file
        File.join(@shared.export_path, Gitlab::ImportExport.version_filename)
      end
    end
  end
end

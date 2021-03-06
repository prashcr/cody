module Cody
  class Logs < Base
    def run
      run_with_exception_handling do
        Tailer.new(@options, build_id).run
      end
    end

    def build_id
      return @options[:build_id] if @options[:build_id]

      resp = codebuild.list_builds_for_project(project_name: @full_project_name)
      resp.ids.first # most recent build_id
    end
  end
end

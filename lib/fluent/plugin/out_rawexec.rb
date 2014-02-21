#
# Fluent
#
# Copyright (C) 2011 FURUHASHI Sadayuki
#
#    Licensed under the Apache License, Version 2.0 (the "License");
#    you may not use this file except in compliance with the License.
#    You may obtain a copy of the License at
#
#        http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS,
#    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#    See the License for the specific language governing permissions and
#    limitations under the License.
#
module Fluent
  class RawExecOutput < TimeSlicedOutput
    Plugin.register_output('rawexec', self)

    def initialize
      super
      require 'tempfile'
      @localtime = false
    end

    config_param :command, :string

    def configure(conf)
      super

    def format(tag, time, record)
      out = ''
      out << record.to_s
      out << "\n"
      out
    end

    def write(chunk)
      if chunk.respond_to?(:path)
        prog = "#{@command} #{chunk.path}"
      else
        tmpfile = Tempfile.new("fluent-plugin-rawexec-")
        chunk.write_to(tmpfile)
        tmpfile.close
        prog = "#{@command} #{tmpfile.path}"
      end

      system(prog)
      ecode = $?.to_i
      tmpfile.delete if tmpfile

      if ecode != 0
        raise "command returns #{ecode}: #{prog}"
      end
    end
  end
end

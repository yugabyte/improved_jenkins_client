#
# Copyright (c) 2012 Kannan Manickam <arangamani.kannan@gmail.com>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
#

require 'improved_jenkins_client/version'
require 'improved_jenkins_client/exceptions'
require 'improved_jenkins_client/client'
require 'improved_jenkins_client/job'
require 'improved_jenkins_client/node'
require 'improved_jenkins_client/system'
require 'improved_jenkins_client/view'
require 'improved_jenkins_client/build_queue'
require 'improved_jenkins_client/plugin_manager'
require 'improved_jenkins_client/user'
require 'improved_jenkins_client/root'

require 'improved_jenkins_client/cli/helper'
require 'improved_jenkins_client/cli/base'
require 'improved_jenkins_client/cli/job'
require 'improved_jenkins_client/cli/node'
require 'improved_jenkins_client/cli/system'

module JenkinsApi
  class Client
    module PluginSettings
      class InvalidType < Exception; end

      autoload :Base, 'improved_jenkins_client/plugin_settings/base'
      autoload :Hipchat, 'improved_jenkins_client/plugin_settings/hipchat'
      autoload :WorkspaceCleanup, 'improved_jenkins_client/plugin_settings/workspace_cleanup'
      autoload :Collection, 'improved_jenkins_client/plugin_settings/collection'
    end
  end
end

require 'ostruct'
require "puttfs/version"

module Puttfs
  def self.defaults
    {:output => $stdout}
  end

  @config = OpenStruct.new(defaults)

  POINTY_ARROW = (
    <<EOF

                   .::.
                 .:::;;;.
               .:;;;;;;;:;.
             .:::;;;;;;;;;'
           .:;;;;;;;;;;;'
     :;. .::::;;;;;;;;'
     :;;::::;;;;;;;;'
     :;;::::;;;;;;'
     :;;::::;;;;'
     :;;;;;;::;
     :;;;;;;::;;
     ''''''''''''


EOF
  ).freeze

  def self.configure(&block)
    block.call(config) if block_given?
  end

  def self.config
    @config
  end

  def self.puttfs(*objs)
    config.output.puts POINTY_ARROW, *objs
  end
end

module Kernel
  private
  def puttfs(*objs)
    Puttfs.puttfs(*objs)
  end
end

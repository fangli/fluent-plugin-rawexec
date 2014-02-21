# Fluent::Plugin::Rawexec, a plugin for [Fluentd](http://fluentd.org)

fluent-plugin-rawexec is a buffered output plugin for fluentd.

The only difference between the offical out_exec is

**fluent-plugin-rawexec write raw message body into tmp file rather than filtered keys**

So there is no "keys" option in this plugin.
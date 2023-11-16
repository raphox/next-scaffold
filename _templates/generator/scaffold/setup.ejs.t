---
to: .next_rails_scaffold.json.lock
unless_exists: true
sh: <%= actionfolder %>/setup.sh
---
{
  "version": "<%= npm_package_version %>",
  "installationDate": "<%= new Date().toISOString() %>"
}
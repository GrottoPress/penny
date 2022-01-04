# By default Lucky will serve static assets in development and production.
#
# However you could use a CDN when in production like this:
#
#   Lucky::Server.configure do |settings|
#     if LuckyEnv.production?
#       settings.asset_host = "https://mycdnhost.com"
#     else
#       settings.asset_host = ""
#     end
#   end
Lucky::Server.configure do |settings|
  settings.asset_host = ENV["ASSETS_HOST"]
end

# Load the asset manifest in public/mix-manifest.json
Lucky::AssetHelpers.load_manifest

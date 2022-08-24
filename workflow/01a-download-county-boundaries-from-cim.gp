# Download counties layer.
# - this should only need to be done periodically
# - download from Colorado Information Marketplace
WebGet(URL="https://data.colorado.gov/resource/ahgn-r8s5.geojson",OutputFile="downloads/co-counties.geojson",Timeout="10")
#
# Don't do this because CIM layer has 15 digits.  Cut back to 5 to reduce file size.
# Copy to the 'layers' folder.  If clipping to the Poudre is implemented, use a 02* command file.
#CopyFile(SourceFile="downloads/co-counties.geojson",DestinationFile="../data/co-counties.geojson")
#
# Read the file from 'downloads/' and rewrite to '../data/' to cut back on the number digits:
# - use 7 digits, which is the practical limit of surveying, but unlikely that the original data had this precision
ReadGeoLayerFromGeoJSON(InputFile="downloads/co-counties.geojson",GeoLayerID="CountiesLayer",Name="Counties",Description="Counties")
WriteGeoLayerToGeoJSON(GeoLayerID="CountiesLayer",OutputFile="../data/co-counties.geojson",OutputPrecision="7")
# The following does not make that much difference in file size so don't do yet.
#WriteGeoLayerToGeoJSON(GeoLayerID="CountiesLayer",OutputFile="../data/co-counties-6digits.geojson",OutputPrecision="6")
#WriteGeoLayerToGeoJSON(GeoLayerID="CountiesLayer",OutputFile="../data/co-counties-5digits.geojson",OutputPrecision="5")
#WriteGeoLayerToGeoJSON(GeoLayerID="CountiesLayer",OutputFile="../data/co-counties-4digits.geojson",OutputPrecision="4")

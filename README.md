# owf-data-co-counties #

This repository contains the [Open Water Foundation (OWF)](http://openwaterfoundation.org) dataset for Colorado counties.
This is a foundational dataset that provides unique identifiers and other data for counties.
The identifiers can be used to link other datasets, such as water providers and municipalities within counties.
OWF has created and is maintaining this dataset to facilitate work on various data analysis and visualization projects in Colorado. 

The following sections provide a summary of the project repository:

* [Repository Contents](#repository-contents)
* [Attribution](#attribution)
* [How to Use the Data](#how-to-use-the-data)
* [License](#license)
* [Contributing](#contributing)
* [Maintainers](#maintainers)
* [Contributors](#contributors)


## Repository Contents ##

The repository contains the following:

```text
analysis/                                   TSTool software command files used to process data into useful forms.
  Process-xlsx-to-csv.TSTool                TSTool command file that processes the core dataset from .xlsx to .csv.
data-orig-process/                          Folder containing files, such as TSTool command files, for processing original data into usable formats
  FIPS-Headings.csv                         Data file of column names needed to process FIPS data.
  Process-original-data-to-csv.TSTool       TSTool command file that processes data either directly from websites or data files manually downloaded from websites to be incorporated into the main dataset
data-orig/                                  Folder containing original data files downloaded from agency websites.
  Colorado-Counties-WGS84.geojson           Exported spatial data file from the Colorado Water Conservation Board Data Viewer's County layer, converted to WGS 84.  
  Colorado-County-Basin-Intersection.csv    Saved attribute table of the intersection of the county and IBCC basin geojson files that allows for determining the fraction of each IBCC basin within a particular county.
  Colorado-DOLA-LocalGovt-IDs-Counties.csv  The data file that is a copy of the Department of Local Affairs' Local Government Information System website that contains local government IDs (DOLA_LG_ID). 
  Colorado-FIPS-Counties.txt                The data file containing original data download from the U.S. Census Bureau containing FIPS IDs.
  Colorado-GNIS-Civil.csv                   The data file containing original data download from the Geographic Names Information System containing GNIS IDs.
  Colorado-IBCC-Basins-WGS84.geojson        Exported spatial data file from the Colorado Water Conservation Board Data Viewer's IBCC Basin layer, converted to WGS 84.
data/                                       Folder containing data files.
  Colorado-Counties.xlsx                    Simple Excel file containing core data.
  Colorado-Counties.csv                     The Excel file contents from the County worksheet converted to a csv file, useful for automated processing.
  County-Basin-Relate.csv                   The Excel file contents from the County_Basin_Relate worksheet converted to a csv file, useful for automated processing.
doc/
  ?                                         Additional documentation for the dataset.
.gitattributes                              Git configuration file indicate repository configuration, in particular handling of line-ending and binary files.
.gitignore                                  Git configuration file to ignore files that should not be committed to the repository.
README.md                                   Explanation of repository contents, data files and sources and TSTool command files used to process the core data into other products.
```

### Colorado-Counties.xlsx Contents ###

The core Excel workbook that serves as the master data contains the following data columns within the **County** worksheet.

* **CountyName** -- name of the county
* **State_Abbrev** -- abbreviation of the state the county is in
* **FIPS_ID** -- 3-digit [Federal Information Processing Standard](https://www.census.gov/geo/reference/codes/cou.html) code, to link federal datasets
* **FIPS_ID_Flag** -- data status of FIPS_ID values; see more detail below
* **GNIS_ID** -- [Geographic Names Information System](https://geonames.usgs.gov/apex/f?p=138:1:9185633219989) identifier, to link federal datasets
* **GNIS_ID_Flag** -- data status of GNIS_ID values; see more detail below
* **DOLA_LG_ID** -- 5-digit identifier used by Colorado's [Department of Local Affairs (DOLA)](https://dola.colorado.gov/lgis/counties.jsf), to link DOLA datasets
* **DOLA_LG_ID_Flag** -- data status of DOLA_LG_ID values; see more detail below
* **IBCC_Basin_CSV** -- basin in which the county is contained.  Several counties are in more than one basin.  In these cases, each basin is listed in alphabetical order, separated by commas.  Counties in multiple basins can also be found in the **County_Basin_Relate** worksheet.
* **Num_IBCC_Basin** -- number of basins within the county's boundaries.  This is a quick way to determine if the county is in multiple basins.
* **Comment** -- any other information about the county

Each type of identifier also contains a data column of the same name with the word "_Flag" added to the column name.  These columns are an indication of data status as it relates to missing data.  The following conventions are used:
* G = ID is a known/good value.  
* g = ID is an estimated (but good) value.  The associated ID cell is also highlighted in yellow.
* N = ID is not applicable for the county and a blank cell is expected.
* M = ID is known to be missing in original source and therefore a blank cell indicates that a value cannot be provided.
* m = ID is estimated to be missing.  The associated ID cell is also highlighted in gray.
* z = ID is unable to be confirmed.  A value is possible but cannot be confirmed one way or the other.  The associated ID cell is also highlighted in orange.
* x = OWF has not made an attempt to populate the cell at this time.  The value is missing because OWF has not attempted to find the value.  The associated cell is also highlighted in black.

Column names are taken from original sources if possible.  For clarity and attribution, agency abbreviations may be added to the original column name.  Column name length is not restricted, therefore, some data representations such as Esri shapefiles may contain truncated column names.  In such cases, alternative formats such as GeoJSON are recommended.

Descriptions of identifiers are also provided in the **Notes** worksheet within the workbook.  This worksheet also details how the original data were downloaded and where to find those files.


Other worksheets within the workbook contain the following:

* **County_Basin_Relate** worksheet lists the counties that are contained in more than one basin.  This worksheet is organized so that each basin within a county is its own record.  Therefore, the same county may be listed in more than one row and be associated with a different basin.  This will allow for the establishment of one-to-many relationships when linking to and processing other datasets.

* **IBCC_Basin** worksheet is simply a list of the Interbasin Compact Committee (IBCC) river basins in Colorado.  It is used to fill in basin data in other worksheets to ensure data consistency, i.e., no grammatical errors when typing in a basin name.

* **ChangeLog** worksheet indicates any changes made to the dataset, the date they occurred and who made the changes.

* **Metadata_County** worksheet serves as the metadata for data columns in the **County** worksheet.

### Colorado-Counties.csv Contents ###

This file is the **County** worksheet saved in csv format.  Warning:  if this file is opened directly in Excel, IDs that contain leading zeroes will not show those zeroes.  Instead, import the file into a blank Excel file by selecting Data/Get External Data/From Text.

### County_Basin_Relate.csv Contents ###

This file is the **County_Basin_Relate** worksheet saved in csv format.  Warning:  if this file is opened directly in Excel, IDs that contain leading zeroes will not show those zeroes.  Instead, import the file into a blank Excel file by selecting Data/Get External Data/From Text.

## Attribution ##

The data sources for this dataset are listed below.

* Data available from the [U.S. Census Bureau](https://www.census.gov/geo/reference/codes/cou.html) includes municipal Federal Information Processing Standard (FIPS) codes.
* The U.S. Geological Survey (USGS)'s [Geographic Names Information System (GNIS)](https://geonames.usgs.gov/apex/f?p=138:1:9185633219989) is the Federal and national standard for geographic nomenclature.  The USGS developed the GNIS in support of the U.S. Board on Geographic Names as the official repository of domestic geographic names data.  OWF manually cross-referenced the Feature Name column to the CountyName.
* The Colorado Department of Local Affairs (DOLA)'s [Local Government Information System](https://dola.colorado.gov/lgis/counties.jsf) uses a local government ID (LG ID).  Data were copied directly from the website and pasted into Excel.  OWF manually cross-referenced the County Name to the CountyName.  OWF is using DOLA_LG_ID instead of LG ID to add more description to the identifier.
* County and IBCC basin boundaries were found by accessing the Colorado Water Conservation Board's [Data Viewer](https://www.coloradodnr.info/h5v/Index.html?viewer=cwcbviewer).  The "County" and "IBCC Basin" layers were downloaded and opened in QGIS, converted to WGS 84 (EPSG:4326) and saved in GeoJSON format.  A new shapefile of the intersection of the two layers was created to determine which basins are in each county and the fraction of each basin within each county.

## How to Use the Data ##

The Colorado Counties dataset provides a complete statewide list of counties assembled from multiple sources.  There are several unique identifiers for each county and the dataset allows cross-referencing the identifiers
so that other datasets can be joined.  For example, the [Colorado Water Providers dataset](https://github.com/OpenWaterFoundation/owf-data-co-municipal-water-providers) contains county names and can be used to link additional data.

The Excel and csv files can be used as tabular datasets as is, to create filtered lists or to link to other datasets.  Data-processing software such as TSTool can be used to link this dataset to other datasets.  Datasets can be used within GIS software to create maps.

The format and contents of the dataset will change over time.  It is recommended to save a copy of the dataset for local processing or to fix the version in time.

## License ##

The license is being determined.  All the data are public so there are not really any restrictions on use.

## Contributing ##

The Open Water Foundation is adding value by cross-referencing datasets.
If you use the dataset and have comments, please contact the maintainers and/or use the GitHub issues to provide feedback.

## Maintainers ##

Kristin Swaim (@kswaim, kristin.swaim@openwaterfoundation.org) is the primary maintainer at the Open Water Foundation.

Steve Malers (@smalers, steve.malers@openwaterfoundation.org) is the secondary contact.

## Contributors ##

None yet, other than OWF staff.
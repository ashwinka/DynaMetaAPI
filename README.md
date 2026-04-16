# DynaMetaAPI
API microservice for the CRUD operation on the module data based on DB metadata.
This is the generic framewrok backend application/microservice.
The application will have 2 seggregations
1. Frawork related DB tables and entities.
2. Functional specific Modules which is completly driven from metadata.
   Each Module will be associate to the parent or Root DB Table.
   Complete DB table and Columns will be maintained as the DB metadata
   Each Module in the UI will have Listing screen, Edit screen, Lookup Screen, I18N translations.
   Listing screen will be rendered by Listing Metadata and the data API queries will be dynamically constructed from metadata.
   Edit screen will be rendered by Form Metadata (multiple forms can be configured), save operation will be handled in 2 approaches. full save/update and delta changes patch.
   Lookup is similat to Listing screen excepted widgets, This will be opened for the lookup fields.
   

# Ductwork Examples

Rails application with example pipelines. See online documentation for more details.

**[Full Documentation](https://docs.getductwork.io/)**

## Setup

Run `bin/setup`

To re-seed the database run `bin/setup --reset`

## Usage

This application includes a number of example pipelines meant to get you familiar with them and inspire you to design your own. You can view progress in the logs or on the console.

### `EnrichAllUsersDataPipeline`

This pipeline is meant to minic a typical data enrichment process where data is fetched from multiple sources in parallel and then merged back into the record and persisted in the database.

You can trigger the user enrichment pipeline on the rails console with `EnrichAllUsersDataPipeline.trigger(7)` or with the rake task `bin/rails enrich_user_data`.

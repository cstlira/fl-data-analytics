with source as (

    select * from {{ source('tickit', 'category') }}

),

renamed as (

    select
        catid as category_id,
        catgroup as category_group,
        catname as category_name,
        catdesc as category_desc

    from source

)

select * from renamed

with base as (
    select 
        order_id, 
        restaurant_id,
        customer_id,
        status, 
        total,
        created_at,
        updated_at,
        row_number() over (
            partition by order_id
            order by updated_at desc
        ) as rn
    from read_csv_auto('data/raw/orders.csv')
)

select 
    order_id, 
    restaurant_id,
    customer_id,
    status, 
    total,
    created_at,
    updated_at
from base
where rn = 1

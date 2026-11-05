select restaurant_id, count(distinct order_id) as order_count, COALESCE(SUM(total::DECIMAL(10,2)), 0) as total_revenue
from read_csv_auto('data/raw/orders.csv')
where status = 'completed'
group by restaurant_id
order by COALESCE(SUM(total::DECIMAL(10,2)), 0) desc
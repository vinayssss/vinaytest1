view: sql_spt {
  derived_table: {
    sql: select
      products.brand,sum(sale_price) as total_sales from order_items
      left outer join products on order_items.id=products.id
      group by products.brand
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }

  dimension: total_sales {
    type: number
    sql: ${TABLE}.total_sales ;;
  }

  set: detail {
    fields: [brand, total_sales]
  }
}

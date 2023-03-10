# If necessary, uncomment the line below to include explore_source.
# include: "ecommerce_vinay.model.lkml"

view: order_item_ndt{
  derived_table: {
    explore_source: order_items {
      column: order_id {}
      column: total_revenue {}
    }
  }
  dimension: order_id {
    description: ""
    type: number
  }
  dimension: total_revenue {
    description: ""
    type: number
  }
}

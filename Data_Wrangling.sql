/* 
 MASTER QUERY: CLEANED + JOINED SALES DATA

Structure followed (as per diagram):
sales_trimmed_cleaned_n 
  → product_hierarchy → product_names
  → store_cities → city_names → store_names

All columns are cleaned with TRIM() and IFNULL() to ensure:
  - No NULL values are returned (converted to empty strings)
  - No extra spaces exist in string fields

*/

SELECT 
    /* --- SALES DATA --- */
    TRIM(IFNULL(s.Date, '')) AS Date,
    TRIM(IFNULL(s.Day, '')) AS Day,
    TRIM(IFNULL(s.Month, '')) AS Month,
    TRIM(IFNULL(s.Year, '')) AS Year,
    TRIM(IFNULL(s.Customer_Age, '')) AS Customer_Age,
    TRIM(IFNULL(s.Age_Group, '')) AS Age_Group,
    TRIM(IFNULL(s.Customer_Gender, '')) AS Customer_Gender,
    TRIM(IFNULL(s.Country, '')) AS Country,
    TRIM(IFNULL(s.State, '')) AS State,
    TRIM(IFNULL(s.Product_Category, '')) AS Product_Category,
    TRIM(IFNULL(s.Sub_Category, '')) AS Sub_Category,
    TRIM(IFNULL(s.Product, '')) AS Product,
    TRIM(IFNULL(s.Order_Quantity, '')) AS Order_Quantity,
    TRIM(IFNULL(s.Unit_Cost, '')) AS Unit_Cost,
    TRIM(IFNULL(s.Unit_Price, '')) AS Unit_Price,
    TRIM(IFNULL(s.Profit, '')) AS Profit,
    TRIM(IFNULL(s.Cost, '')) AS Cost,
    TRIM(IFNULL(s.Revenue, '')) AS Revenue,

    /* --- PRODUCT HIERARCHY --- */
    TRIM(IFNULL(ph.product_id, '')) AS product_id,
    TRIM(IFNULL(ph.product_length, '')) AS product_length,
    TRIM(IFNULL(ph.product_depth, '')) AS product_depth,
    TRIM(IFNULL(ph.product_width, '')) AS product_width,
    TRIM(IFNULL(ph.cluster_id, '')) AS cluster_id,
    TRIM(IFNULL(ph.hierarchy1_id, '')) AS hierarchy1_id,
    TRIM(IFNULL(ph.hierarchy2_id, '')) AS hierarchy2_id,
    TRIM(IFNULL(ph.hierarchy3_id, '')) AS hierarchy3_id,
    TRIM(IFNULL(ph.hierarchy4_id, '')) AS hierarchy4_id,
    TRIM(IFNULL(ph.hierarchy5_id, '')) AS hierarchy5_id,

    /* --- PRODUCT NAMES --- */
    TRIM(IFNULL(pn.product_name, '')) AS product_name,

    /* --- STORE CITIES --- */
    TRIM(IFNULL(sc.store_id, '')) AS store_id,
    TRIM(IFNULL(sc.city_id, '')) AS city_id,
    TRIM(IFNULL(sc.store_name_id, '')) AS store_name_id,

    /* --- CITY NAMES --- */
    TRIM(IFNULL(cn.city_name, '')) AS city_name,

    /* --- STORE NAMES --- */
    TRIM(IFNULL(sn.store_name, '')) AS store_name

FROM sales_trimmed_cleaned_n AS s

/* JOIN product hierarchy */
LEFT JOIN product_hierarchy AS ph
    ON s.Product = ph.product_id

/* JOIN product names */
LEFT JOIN product_names AS pn
    ON ph.product_id = pn.product_id

/* JOIN store-city relationship */
LEFT JOIN store_cities AS sc
    ON s.State = sc.city_id  /* Adjust if actual key differs */

/* JOIN city names */
LEFT JOIN city_names AS cn
    ON sc.city_id = cn.city_id

/* JOIN store names */
LEFT JOIN store_names AS sn
    ON sc.store_id = sn.store_id;

/* 
   END OF QUERY
   */

CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `cms`.`view_product` AS
    SELECT 
        `cms`.`product`.`product_id` AS `product_id`,
        `cms`.`product`.`company_id` AS `company_id`,
        `view_sub_category`.`category_id` AS `category_id`,
        `cms`.`product`.`sub_category_id` AS `sub_category_id`,
        `cms`.`product_description`.`language_id` AS `language_id`,
        `view_sub_category`.`sub_category_language_id` AS `sub_category_language_id`,
        `view_sub_category`.`category_name` AS `category_name`,
        `view_sub_category`.`sub_category_name` AS `sub_category_name`,
        `view_sub_category`.`image` AS `sub_category_image`,
        `view_sub_category`.`icon` AS `sub_category_icon`,
        `cms`.`product_description`.`product_description_id` AS `product_description_id`,
        `cms`.`product_description`.`name` AS `name`,
        `cms`.`product_description`.`description` AS `description`,
        `cms`.`product_description`.`url` AS `url`,
        `cms`.`product_description`.`viewed` AS `viewed`,
        `cms`.`product`.`model` AS `model`,
        `cms`.`product`.`image` AS `image`,
        `cms`.`product`.`original_price` AS `original_price`,
        `cms`.`product`.`special_status` AS `special_status`,
        `cms`.`product`.`special_price` AS `special_price`,
        `cms`.`product`.`expiry_date` AS `expiry_date`,
        `cms`.`product`.`weight` AS `weight`,
        `cms`.`product`.`weight_unit` AS `weight_unit`,
        `cms`.`product`.`ordered` AS `ordered`,
        `cms`.`product`.`tax_class_id` AS `tax_class_id`,
        `cms`.`product`.`manufacturer_id` AS `manufacturer_id`,
        `cms`.`product`.`liked` AS `liked`,
        `cms`.`product`.`is_feature` AS `is_feature`,
        `cms`.`product`.`slug` AS `slug`,
        `cms`.`product`.`create_date` AS `create_date`,
        `cms`.`product`.`create_by_id` AS `create_by_id`,
        `cms`.`product`.`edit_date` AS `edit_date`,
        `cms`.`product`.`edit_by_id` AS `edit_by_id`,
        `cms`.`product`.`status` AS `status`
    FROM
        ((`cms`.`product`
        LEFT JOIN `cms`.`product_description` ON (`cms`.`product`.`product_id` = `cms`.`product_description`.`product_id`))
        LEFT JOIN `cms`.`view_sub_category` ON (`view_sub_category`.`sub_category_id` = `cms`.`product`.`sub_category_id`))
    WHERE
        `cms`.`product_description`.`language_id` IS NOT NULL
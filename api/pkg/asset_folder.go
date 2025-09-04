package pkg

func FolderImages() []string {
	return []string{
		"user_photos",
		"customer_photos",
		"supplier_photos",
		"logo_prints",
		"logos",
		"items",
		"signatures",
		"item_categories",
		"commission_sales_transfer_proofs",
	}
}

func FolderTempImages() []string {
	return []string{
		"temp_user_photos",
		"temp_customer_photos",
		"temp_supplier_photos",
		"temp_items",
		"temp_signatures",
		"temp_item_categories",
		"temp_commission_sales_transfer_proofs",
	}
}

func FolderDocuments() []string {
	return []string{
		"user",
		"po_customer",
		"work_order",
		"supplier",
		"customer",
		"po_supplier",
		"purchaseing",
		"purchaseing_return",
		"selling",
		"selling_return",
		"delivery_order",
	}
}

func FolderTempDocuments() []string {
	return []string{
		"temp_user",
		"temp_po_customer",
		"temp_work_order",
		"temp_supplier",
		"temp_customer",
		"temp_po_supplier",
		"temp_purchaseing",
		"temp_purchaseing_return",
		"temp_selling",
		"temp_selling_return",
		"temp_delivery_order",
	}
}

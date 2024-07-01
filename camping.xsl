<?xml version="1.0" encoding="UTF-8"?>
<!--
   New Perspectives on XML, 3rd Edition
   Tutorial 5
   Case Problem 4

   Cairn Camping Store XSLT Style Sheet
   Author: Matt Ramey
   Date:   6/28/24

   Filename:         camping.xsl
   Supporting Files: camping.xml
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN"
    doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" indent="yes" />

  <xsl:template match="/">
    <html xmlns="http://www.w3.org/1999/xhtml">
      <head>
        <title>Cairn Camping Store</title>
        <style>
          body { font-family: Arial, sans-serif; }
          h1 { color: #343; }
          table { width: 100%; border-collapse: collapse; margin-bottom: 20px; }
          th, td { border: 1px solid #ddd; padding: 8px; }
          th { background-color: #f2f2f2; }
          tr:nth-child(even) { background-color: #f9f9f9; }
        </style>
      </head>
      <body>
        <h1>Cairn Camping Store</h1>
        <!-- Apply templates for customers -->
        <xsl:apply-templates select="root/customers/customer">
          <xsl:sort select="name" order="ascending" />
        </xsl:apply-templates>
      </body>
    </html>
  </xsl:template>

  <!-- Template to match customer elements -->
  <xsl:template match="customer">
    <h2>Customer Information</h2>
    <table>
      <tr>
        <th>Name</th>
        <th>Street</th>
        <th>City</th>
        <th>State</th>
        <th>Zip</th>
        <th>ID</th>
      </tr>
      <tr>
        <td><xsl:value-of select="name" /></td>
        <td><xsl:value-of select="street" /></td>
        <td><xsl:value-of select="city" /></td>
        <td><xsl:value-of select="state" /></td>
        <td><xsl:value-of select="zip" /></td>
        <td><xsl:value-of select="@cid" /></td>
      </tr>
    </table>
    <!-- Apply templates for orders -->
    <xsl:apply-templates select="orders/order">
      <xsl:sort select="@oid" order="descending" />
    </xsl:apply-templates>
  </xsl:template>

  <!-- Template to match order elements -->
  <xsl:template match="order">
    <h3>Order ID: <xsl:value-of select="@oid" /></h3>
    <p>Order Date: <xsl:value-of select="date" /></p>
    <table>
      <tr>
        <th>Item ID</th>
        <th>Quantity</th>
        <th>Description</th>
      </tr>
      <!-- Apply templates for items -->
      <xsl:for-each select="item">
        <xsl:sort select="qty" data-type="number" order="descending" />
        <xsl:sort select="@iid" order="ascending" />
        <tr>
          <td><xsl:value-of select="@iid" /></td>
          <td><xsl:value-of select="qty" /></td>
          <td><xsl:value-of select="description" /></td>
        </tr>
      </xsl:for-each>
    </table>
  </xsl:template>
</xsl:stylesheet>
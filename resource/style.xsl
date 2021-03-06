<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:s="http://sqlfairy.sourceforge.net/sqlfairy.xml">
    <xsl:output method="html" encoding="utf8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN"/>

    <xsl:template match="database">
        <html lang="ja">
            <head>
                <meta charset="utf-8"/>
                <title>テーブル定義</title>
                <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"/>
                <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css"/>
                <style>
                    table.htable {
                    margin: 3em auto 1em auto !important;
                    }
                    table.htable th {
                    border-left: 10px solid #e5e5e5 !important;
                    }
                    footer {
                    border-top: 1px solid #e5e5e5;
                    padding: 0.5em;
                    }
                    .table-condensed {
                    page-break-after: always !important;
                    }
                    thead { display: table-header-group }
                    tfoot { display: table-row-group }
                    tr { page-break-inside: avoid }

                </style>
            </head>

            <body>
                <div class="container">
                    <h1 class="page-header">テーブル定義</h1>
                    <xsl:apply-templates select="table_structure"/>
                </div>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="table_structure">
        <table class="table table-bordered htable">
            <tbody>
                <tr class="active">
                    <th>テーブル名</th>
                    <td>
                        <xsl:value-of select="options/@Comment"/>
                    </td>
                </tr>
                <tr class="active">
                    <th>スキーマ</th>
                    <td><xsl:value-of select="@name"/></td>
                </tr>
            </tbody>
        </table>
        <table class="table table-condensed">
            <thead>
                <tr>
                    <th class="text-right">#</th>
                    <th>論理名</th>
                    <th>物理名</th>
                    <th>型</th>
                    <th>NULL</th>
                    <th>デフォルト値</th>
                    <th>主キー</th>
                    <th>ユニーク</th>
                </tr>
            </thead>
            <tbody>
                <xsl:apply-templates select="field"/>
            </tbody>
        </table>
    </xsl:template>

    <xsl:template match="field">
        <tr>
            <td class="text-right"><xsl:value-of select="position()"/></td>
            <td><xsl:value-of select="@Comment"/></td>
            <td><xsl:value-of select="@Field"/></td>
            <td><xsl:value-of select="@Type"/></td>
            <td><xsl:if test="@Null='YES'"><span class="glyphicon glyphicon-ok"></span></xsl:if></td>
            <td><xsl:value-of select="@Default"/></td>
            <td><xsl:if test="@Key='PRI'"><span class="glyphicon glyphicon-ok"></span></xsl:if></td>
            <td><xsl:if test="@Key='UNI'"><span class="glyphicon glyphicon-ok"></span></xsl:if></td>
        </tr>
    </xsl:template>

</xsl:stylesheet>

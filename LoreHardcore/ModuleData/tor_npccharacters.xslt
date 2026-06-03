<?xml version="1.0" encoding="utf-8"?>
<!--
    Lore-Hardcore — XSLT-patch: удаление избыточных orc-lord-героев.

    ПРОБЛЕМА (жалоба клиента 2026-05-06): «Massif Choppas объединяет 22 лорда
    в одну Army = 3700 орков». Среднее по orc-кингдомам ~16 лордов, у Massif
    Choppas 22 (на 38% выше).

    ФИКС: удаляем 4 лорда из each clan'а Massif Choppas + 3 лорда у Crooked Eye
    и Red Eye (которые тоже завышены, 19 vs 16 average).

    Удаляются:
      Massif Choppas clan_1 (12→8): _first_9, _first_10, _first_11, _first_12
      Massif Choppas clan_2 (10→6): _second_7, _second_8, _second_9, _second_10
      Crooked Eye (19→16):          _first_8, _first_9, _first_10
      Red Eye (19→16):              _first_9, _first_10, _first_11

    После: Massif Choppas 14, Crooked Eye 16, Red Eye 16. Близко к среднему.

    Применяется к TOR'овскому tor_npccharacters (path в SubModule.xml). Лорды
    лежат в физическом файле tor_npccharacters/tor_campaign_lords.xml — но
    Bannerlord загружает их под единым XmlName id="NPCCharacters" path="tor_npccharacters".
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" omit-xml-declaration="no" indent="yes"/>

    <!-- identity transform -->
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

    <!-- Massif Choppas clan_1: -4 лорда -->
    <xsl:template match="NPCCharacter[@id='tor_greenskin_lord_massif_choppas_first_9']" />
    <xsl:template match="NPCCharacter[@id='tor_greenskin_lord_massif_choppas_first_10']" />
    <xsl:template match="NPCCharacter[@id='tor_greenskin_lord_massif_choppas_first_11']" />
    <xsl:template match="NPCCharacter[@id='tor_greenskin_lord_massif_choppas_first_12']" />

    <!-- Massif Choppas clan_2: -4 лорда -->
    <xsl:template match="NPCCharacter[@id='tor_greenskin_lord_massif_choppas_second_7']" />
    <xsl:template match="NPCCharacter[@id='tor_greenskin_lord_massif_choppas_second_8']" />
    <xsl:template match="NPCCharacter[@id='tor_greenskin_lord_massif_choppas_second_9']" />
    <xsl:template match="NPCCharacter[@id='tor_greenskin_lord_massif_choppas_second_10']" />

    <!-- Crooked Eye: -3 лорда (19→16) -->
    <xsl:template match="NPCCharacter[@id='tor_greenskin_lord_crooked_eye_first_8']" />
    <xsl:template match="NPCCharacter[@id='tor_greenskin_lord_crooked_eye_first_9']" />
    <xsl:template match="NPCCharacter[@id='tor_greenskin_lord_crooked_eye_first_10']" />

    <!-- Red Eye: -3 лорда (19→16) -->
    <xsl:template match="NPCCharacter[@id='tor_greenskin_lord_red_eye_first_9']" />
    <xsl:template match="NPCCharacter[@id='tor_greenskin_lord_red_eye_first_10']" />
    <xsl:template match="NPCCharacter[@id='tor_greenskin_lord_red_eye_first_11']" />
</xsl:stylesheet>

<?xml version="1.0" encoding="utf-8"?>
<!--
    Lore-Hardcore — рынок Хаоса: фикс пропажи купленной брони после сейв/лоада.

    ПРИЧИНА БАГА (2026-05-31): TOR помечает топовую броню Хаоса is_merchandise="false".
    Bannerlord сохраняет ссылки на предметы в сейве через таблицу объектов кампании,
    куда попадают ТОЛЬКО is_merchandise="true". Предмет с "false" существует лишь как
    шаблон экипировки войск (ре-деривируется из XML трупа при загрузке — поэтому войска
    гир не теряют). Если игрок купил/надел такой предмет — после загрузки ссылку
    восстановить не из чего → слот пустеет → «персонаж голый», из инвентаря пропадает.

    ФИКС: помечаем носибельную броню Хаоса как is_merchandise="true" → она становится
    настоящим товаром и переживает сейв/лоад.

    ⚠⚠ РАСШИРЕНО 2026-06-15 (баг лута): РАНЬШЕ флипали только ~5 каталожных предметов Воина
    Хаоса, god-гир оставляли "false". Но любой tor_chaos_/tor_chs_ предмет с "false", ВЫПАВШИЙ
    с врага или НАДЕТЫЙ игроком, ломается: иконка вечно грузится, после сейв/лоада предмет
    пропадает (классика is_merchandise="false"). Теперь флипаем ВСЕ chaos-предметы по префиксу.
    Это согласуется с концептом §2.4 («god-сеты — только merchandise=true, урок о пропаже»).
    Лавки: chaos-предметы culture-pooled (chaos_culture) + ChaosItemTradeRestrictPatch держит
    цену 0 вне городов Хаоса; если god-гир всё же будет мелькать в лавках — добавить Harmony-блок
    генерации (план из памяти feedback_non_merchandise_items_vanish_on_save).

    Прецедент рабочего XSLT-патча атрибутов чужих (TOR_Armory) предметов: tor_rangedweapons.xslt.
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" omit-xml-declaration="no" indent="yes"/>

    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

    <!-- ВСЕ chaos-предметы (tor_chaos_/tor_chs_) → is_merchandise="true" (переживают лут/сейв/лоад). -->
    <xsl:template match="Item[starts-with(@id,'tor_chaos_') or starts-with(@id,'tor_chs_')]/@is_merchandise">
        <xsl:attribute name="is_merchandise">true</xsl:attribute>
    </xsl:template>
</xsl:stylesheet>

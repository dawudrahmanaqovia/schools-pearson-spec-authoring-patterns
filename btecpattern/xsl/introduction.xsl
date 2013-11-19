<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions">

<!-- Introduction data section -->
<xsl:template match="introduction">

  <div class="panel panel-primary">
    <div class="panel-heading">
    <span class="panel-title">
    <i class="icon-collapse accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapse2"/><xsl:text>   </xsl:text>
    Unit Introduction
	</span>
      <i class="icon-question-sign pull-right" data-content="The unit introduction should give the reader a snapshot of the purpose of the unit and how it fits into the vocational setting of the qualification" data-original-title="Unit Introduction"/>
    </div>
    <div id="collapse2" class="panel-collapse collapse in">
      <div class="panel-body">
      
		<xsl:apply-templates select="node()"/>

      </div>
    </div>
  </div>
  
	</xsl:template>	
</xsl:stylesheet>

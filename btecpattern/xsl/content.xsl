<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions">

<!--  Learning Aims data section -->
<xsl:template match="learning_objectives" mode="content">
  <div class="panel panel-primary">
    <div class="panel-heading">
    <span class="panel-title">
    <i class="icon-collapse accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseLearningAimContent"/>
		Content
	</span>
	<i class="icon-question-sign pull-right" data-toggle="popover" title="" data-content="The content can be written in lengthy bulleted phrases/scentences and should not just be a list. The breadth and depth of what the learner needs to learn must be clear." data-original-title="Content"/>
    </div>
    <div id="collapseLearningAimContent" class="panel-collapse collapse in">
      <div class="panel-body">
			<!--<div class="panel-group" id="accordion_content">--><!-- Switch off accordion -->
				<xsl:apply-templates select="learning_objective" mode="content"/>
			<!--</div>-->
      </div>
    </div>
  </div>
 
</xsl:template>
<!-- End Learning Aims data section -->



<!-- Learning Aim data section -->
<xsl:template match="learning_objective" mode="content">
		<xsl:apply-templates select="learning_objective_content" mode="content"/>
</xsl:template>
<!-- End Learning Aim data section -->





<!-- Learning Aim Content data section -->
<xsl:template match="learning_objective_content" mode="content">

  <div class="panel panel-info">
    <div class="panel-heading">
    <span class="panel-title">
<!-- Switch off accordian   <i class="icon-collapse accordion-toggle" data-toggle="collapse" data-parent="#accordion_content" href="#collapseContent{count(preceding::learning_objective)+1}"/>-->   
	<i class="icon-collapse accordion-toggle" data-toggle="collapse" href="#collapse_content{count(preceding::learning_objective)+1}"/>
	   Learning Aim <xsl:number count="learning_objective" from="/unit/learning_objectives" level="multiple" format="AA"/>: <xsl:apply-templates select="../learning_objective_title"/>
	</span>
    </div>
    <div id="collapse_content{count(preceding::learning_objective)+1}" class="panel-collapse collapse in">
      <div class="panel-body">
		<xsl:apply-templates select="node()"/>
      </div>
    </div>
  </div>
</xsl:template>	
<!-- End Learning Aim Content data section -->


<!-- Topic data section -->
<xsl:template match="topic">
<div class="well">
<dl>
  <dt><xsl:value-of select="topic_title"/></dt>
  <dd>
	<xsl:apply-templates select="node()[not(self::topic_title)]"/>
</dd>
</dl>
</div>
</xsl:template>	
<!-- End Topic data section -->

</xsl:stylesheet>

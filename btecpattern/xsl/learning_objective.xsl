<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions">

<!-- Learning Aim data section -->
<xsl:template match="learning_objectives" mode="learningaims">
  <div class="panel panel-primary">
    <div class="panel-heading">
    <span class="panel-title">
    <i class="icon-collapse accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseLearningAim"/>
    Learning Aims
	</span>
    </div>
    <div id="collapseLearningAim" class="panel-collapse collapse in">
      <div class="panel-body">
		<div class="row"><div class="col-xs-12">In this unit, you will:</div></div>
		
			<xsl:apply-templates select="learning_objective" mode="learningaims"/>
			
<!--		<div class="row"><div class="col-xs-12"><div class="pull-right">
			<button type="button" class="btn btn-primary" data-placement="auto" data-toggle="tooltip" title="Add" onclick="add_button(this, node)"><i class="icon-plus-sign"/></button><xsl:text> </xsl:text>
			<button type="button" class="btn btn-danger" data-placement="auto" data-toggle="tooltip" title="Remove" onclick="remove_button(this, node)"><i class="icon-minus-sign"/></button>
		</div></div></div>-->

      </div>
    </div>
  </div>		
</xsl:template>



<!-- Insert content section here -->
<xsl:template match="learning_objective" mode="learningaims">

      		<xsl:apply-templates select="learning_objective_title" mode="learningaims"/>
  
</xsl:template>




<!-- Learning Aim titles -->
<xsl:template match="learning_objective_title" mode="learningaims">

	<div class="row">
		<div class="col-xs-1">
			<div class="form-control label-primary" style="color: #ffffff; font-weight: bold;">	
			<xsl:number count="learning_objective" from="/unit/learning_objectives" level="multiple" format="AA"/>: </div>
		</div>
		<div class="col-xs-11">
			<div class="form-control">
				<xsl:apply-templates select="node()"/>
				<i class="icon-question-sign pull-right" data-toggle="popover" title="" data-content="Insert learning aims title here" data-original-title="Learning Aim"/>
			</div>
		</div> 
	</div>
	<br/>
	
</xsl:template>


</xsl:stylesheet>

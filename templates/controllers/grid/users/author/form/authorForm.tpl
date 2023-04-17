{**
 * templates/controllers/grid/users/author/form/authorForm.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * Submission Contributor grid form
 *
 *}

<script>
	$(function() {ldelim}
		$('#editAuthor').pkpHandler(
			'$.pkp.controllers.form.AjaxFormHandler'
		);
	{rdelim});
</script>
aaaaaaaaaaaaaaaaaaa

<hr>
{fbvFormSection title="meu.teste"}
<label for="ddlCores">Selecione um Autor ou registre um novo:</label><br>
<select id="ddlCores" name="ddlCores">
<option value="lobo">lobo</option> 
<option value="cobra">cobra</option> 
<option value="tatu">tatu</option> 
<option value="novo" selected>novo usuário</option> 

</select>
<input type="button" id="btnExibir" value="Selecionar" />

<h2 id="resultado"></h2>  
<script>
	document.getElementById("btnExibir").onclick = function () {
		let ddl = document.getElementById('ddlCores');
		let userfinal = Array.from(ddl.options)
				.filter(option => option.selected)
				.map(option => option.value);
		document.getElementById("resultado").innerHTML = "Você selecionou: " + userfinal;
	};

	</script>       


{/fbvFormSection}
<hr>





<form class="pkp_form" id="editAuthor" method="post" action="{url op="updateAuthor" authorId=$authorId}">
	{csrf}
	{include file="controllers/notification/inPlaceNotification.tpl" notificationId="authorFormNotification"}

	{include
		file="common/userDetails.tpl"
		disableUserNameSection=true
		disableAuthSourceSection=true
		disablePasswordSection=true
		disableSendNotifySection=true
		disableSalutationSection=true
		disableInitialsSection=true
		disablePhoneSection=true
		disableLocaleSection=true
		disableInterestsSection=true
		disableMailingSection=true
		disableSignatureSection=true
		extraContentSectionUnfolded=true
		countryRequired=true
	}
bbbbbbbbbbbbbbbbb
	{fbvFormArea id="submissionSpecific"}
		{fbvFormSection id="userGroupId" title="submission.submit.contributorRole" list=true required=true}
			{iterate from=authorUserGroups item=userGroup}
				{if $userGroupId == $userGroup->getId()}{assign var="checked" value=true}{else}{assign var="checked" value=false}{/if}
				{fbvElement type="radio" id="userGroup"|concat:$userGroup->getId() name="userGroupId" value=$userGroup->getId() checked=$checked label=$userGroup->getLocalizedName() translate=false}
			{/iterate}
		{/fbvFormSection}
		{fbvFormSection list="true"}
			{fbvElement type="checkbox" label="submission.submit.selectPrincipalContact" id="primaryContact" checked=$primaryContact}
			{fbvElement type="checkbox" label="submission.submit.includeInBrowse" id="includeInBrowse" checked=$includeInBrowse}
			{$additionalCheckboxes}
		{/fbvFormSection}
	{/fbvFormArea}
ccccccccccccccccccc
	{if $submissionId}
		<input type="hidden" name="submissionId" value="{$submissionId|escape}" />
	{/if}
	{if $publicationId}
		<input type="hidden" name="publicationId" value="{$publicationId|escape}" />
	{/if}
	{if $gridId}
		<input type="hidden" name="gridId" value="{$gridId|escape}" />
	{/if}
	{if $rowId}
		<input type="hidden" name="rowId" value="{$rowId|escape}" />
	{/if}
dddddddddddddddddd
	<p><span class="formRequired">{translate key="common.requiredField"}</span></p>
	{fbvFormButtons id="step2Buttons" submitText="common.save"}
</form>
eeeeeeeeeeeee
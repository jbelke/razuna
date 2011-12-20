<!---
*
* Copyright (C) 2005-2008 Razuna
*
* This file is part of Razuna - Enterprise Digital Asset Management.
*
* Razuna is free software: you can redistribute it and/or modify
* it under the terms of the GNU Affero Public License as published by
* the Free Software Foundation, either version 3 of the License, or
* (at your option) any later version.
*
* Razuna is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU Affero Public License for more details.
*
* You should have received a copy of the GNU Affero Public License
* along with Razuna. If not, see <http://www.gnu.org/licenses/>.
*
* You may restribute this Program with a special exception to the terms
* and conditions of version 3.0 of the AGPL as described in Razuna's
* FLOSS exception. You should have received a copy of the FLOSS exception
* along with Razuna. If not, see <http://www.razuna.com/licenses/>.
*
--->

<cfoutput>	
<div>
	<form name="form_meta_imp" id="form_meta_imp" method="post" action="#self#" target="_blank">
	<input type="hidden" name="#theaction#" value="c.meta_imp_do">
	<input type="hidden" name="folder_id" value="#attributes.folder_id#">
	<input type="hidden" name="tempid" value="#attributes.tempid#">
	<!--- Desc --->
	<p>#defaultsObj.trans("import_metadata_desc")#</p>
	<div>
		<div style="float:left;width:150px;font-weight:bold;">Apply to...</div>
		<div style="float:left;">
			<cfif structkeyexists(attributes,"isfolder")>to all assets in the folder<cfelse>count selected assets</cfif>
		</div>
		<div style="clear:both;padding-bottom:10px;"></div>
		<div style="float:left;width:150px;font-weight:bold;">File Format</div>
		<div style="float:left;">
			<select name="file_format" id="file_format" style="width:150px;" onchange="appendurl();">
				<option value="csv" selected="selected">CSV</option>
				<option value="xls">XLS</option>
				<option value="xlsx">XLSX</option>
				<option value="xml">XML</option>
			</select>
		</div>
		<!--- First Row --->
		<div style="clear:both;padding-bottom:10px;"></div>
		<div style="float:left;width:150px;font-weight:bold;">Header/Columns</div>
		<div style="float:left;width:300px;">Does the first row in the file contain the header/columns?<br /><input type="radio" name="imp_header" value="true" checked="checked" /> Yes <input type="radio" name="imp_header" value="false" /> No</div>
		<div style="clear:both;padding-bottom:10px;"></div>
		<!--- Template --->
		<div style="clear:both;padding-bottom:10px;"></div>
		<div style="float:left;width:150px;font-weight:bold;">Upload Template</div>
		<div style="float:left;">
			<select name="impp_template" style="width:150px;">
				<option value="" selected="selected">No template</option>
				<cfloop query="qry_imptemp">
					<option value="#imp_temp_id#">#imp_name#</option>
				</cfloop>
			</select>
		</div>
		<!--- Add or append --->
		<div style="clear:both;padding-bottom:10px;"></div>
		<div style="float:left;width:150px;font-weight:bold;">Add or append</div>
		<div style="float:left;width:300px;">According to your decision below the import will either replace or append to the current metadata<br /><input type="radio" name="imp_write" value="replace" checked="checked" /> Replace <input type="radio" name="imp_write" value="add" /> Append</div>
		<div style="clear:both;padding-bottom:10px;"></div>
		<!--- Upload file --->
		<div style="float:left;width:150px;font-weight:bold;padding-top:7px;">Upload File</div>
		<div style="float:left;"><iframe src="#myself#ajax.meta_imp_upload&folder_id=#attributes.folder_id#&tempid=#attributes.tempid#" frameborder="false" scrolling="false" style="border:0px;width:300px;height:35px;" id="metaupload"></iframe></div>
	</div>
	<div style="clear:both;padding-bottom:20px;"></div>
		<!--- Loading Bars --->
	<div style="float:left;padding:10px;color:green;font-weight:bold;display:none;" id="importstatus"></div>
	<div style="float:right;padding:10px;"><input type="submit" name="submitbutton" value="#defaultsObj.trans("header_import_metadata")#" class="button"></div>
	</form>
</div>
	<!--- JS --->
	<script language="JavaScript" type="text/javascript">
		// Load the below when this page gets hit
		// Append to frame url
		function appendurl(){
			// Greab selected file format
			var u = $('##file_format :selected').val();
			alert(u);
			// Append to iframe URL
			$('##metaupload').append('src','&ft=' + u);
		}
	</script>	
</cfoutput>
	

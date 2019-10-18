<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Set_Record_Type_to_Distributor</fullName>
        <field>RecordTypeId</field>
        <lookupValue>Industrial_Distributor</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Set Record Type to Distributor</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Record_Type_to_End_User</fullName>
        <field>RecordTypeId</field>
        <lookupValue>End_User_Account</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Set Record Type to End User</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Record_Type_to_Retailer</fullName>
        <field>RecordTypeId</field>
        <lookupValue>Retailer_Account</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Set Record Type to Retailer</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Site_to_Shipping_City_State</fullName>
        <field>Site</field>
        <formula>IF (NOT(ISBLANK( ShippingCity )), ShippingCity &amp; 
 IF (NOT(ISBLANK( ShippingState )), &quot;, &quot; &amp; ShippingState, &quot;&quot;), 
 IF (NOT(ISBLANK(ShippingState)), ShippingState, 
IF (NOT(ISBLANK( BillingCity )), BillingCity &amp; 
 IF (NOT(ISBLANK( BillingState )), &quot;, &quot; &amp; BillingState, &quot;&quot;), 
 IF (NOT(ISBLANK(BillingState)), BillingState, 
&quot;&quot;))))</formula>
        <name>Set Site to Shipping City, State</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Type_to_Distributor</fullName>
        <field>Type</field>
        <literalValue>Distributor</literalValue>
        <name>Set Type to Distributor</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Type_to_End_User_Prospect</fullName>
        <field>Type</field>
        <literalValue>End User Prospect</literalValue>
        <name>Set Type to End User Prospect</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Type_to_Retailer</fullName>
        <field>Type</field>
        <literalValue>Retailer</literalValue>
        <name>Set Type to Retailer</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Acct%3A Account Site is blank</fullName>
        <actions>
            <name>Set_Site_to_Shipping_City_State</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Site</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>Set Site to Shipping City &amp; State if site is left blank</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>New Distributor Account Created</fullName>
        <actions>
            <name>Set_Record_Type_to_Distributor</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set_Type_to_Distributor</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Type_from_Prospect__c</field>
            <operation>equals</operation>
            <value>Industrial Distributor</value>
        </criteriaItems>
        <description>Set record type to Distributor if converted from a lead where the type = Distributor</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>New End User Account Created</fullName>
        <actions>
            <name>Set_Record_Type_to_End_User</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set_Type_to_End_User_Prospect</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Type_from_Prospect__c</field>
            <operation>equals</operation>
            <value>End User,Other</value>
        </criteriaItems>
        <description>Set record type to End User if converted from a lead where the type = End User or Other</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>New Retailer Account Created</fullName>
        <actions>
            <name>Set_Record_Type_to_Retailer</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set_Type_to_Retailer</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Type_from_Prospect__c</field>
            <operation>equals</operation>
            <value>Retailer</value>
        </criteriaItems>
        <description>Set record type to Retailer if converted from a lead where the type = Retailer</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>

<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Annual_StageName</fullName>
        <field>StageName</field>
        <literalValue>Initial Meeting Scheduled</literalValue>
        <name>Annual StageName</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Create_Annual_Record_Type</fullName>
        <field>RecordTypeId</field>
        <lookupValue>Annual</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Create Annual Record Type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Create_Give_Get_Record_Type</fullName>
        <field>RecordTypeId</field>
        <lookupValue>Give_Get</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Create Give/Get Record Type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Create_Non_Planning_Record_Type</fullName>
        <field>RecordTypeId</field>
        <lookupValue>Non_Planning_Cycle</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Create Non-Planning Record Type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Create_Planning_Record_Type</fullName>
        <field>RecordTypeId</field>
        <lookupValue>Planning_Cycle</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Create Planning Record Type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Current_Annual_Spend</fullName>
        <description>Set Current Annual Spend to Opportunity amount</description>
        <field>Current_Annual_Spend__c</field>
        <formula>Amount</formula>
        <name>Set Current Annual Spend</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Give_Get_StageName</fullName>
        <field>StageName</field>
        <literalValue>Identify and Quantify Opportunity</literalValue>
        <name>Give/Get StageName</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Non_Planning_StageName</fullName>
        <field>StageName</field>
        <literalValue>Seasonal Preparation</literalValue>
        <name>Non-Planning StageName</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Planning_StageName</fullName>
        <field>StageName</field>
        <literalValue>Seasonal Preparation</literalValue>
        <name>Planning StageName</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Contract_End_Date_on_Acct</fullName>
        <field>Contract_End_Date__c</field>
        <formula>New_Contract_End_Date__c</formula>
        <name>Set Contract End Date on Acct</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Contract_Notes_to_Competitive_Notes</fullName>
        <field>Current_Contract_Notes__c</field>
        <formula>Competitive_Notes__c</formula>
        <name>Set Contract Notes to Competitive Notes</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Current_Supplier_to_Aramark</fullName>
        <field>Current_Supplier__c</field>
        <literalValue>Aramark</literalValue>
        <name>Set Current Supplier to Aramark</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Current_Supplier_to_Bulwark</fullName>
        <field>Current_Supplier__c</field>
        <literalValue>Bulwark</literalValue>
        <name>Set Current Supplier to Bulwark</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Current_Supplier_to_Carhartt</fullName>
        <field>Current_Supplier__c</field>
        <literalValue>Carhartt</literalValue>
        <name>Set Current Supplier to Carhartt</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Current_Supplier_to_Carhartt</fullName>
        <field>Current_Supplier__c</field>
        <literalValue>Carhartt</literalValue>
        <name>Set Current Supplier to Carhartt</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Current_Supplier_to_Cintas</fullName>
        <field>Current_Supplier__c</field>
        <literalValue>Cintas</literalValue>
        <name>Set Current Supplier to Cintas</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Current_Supplier_to_Dakota</fullName>
        <field>Current_Supplier__c</field>
        <literalValue>Dakota</literalValue>
        <name>Set Current Supplier to Dakota</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Current_Supplier_to_DriFire</fullName>
        <field>Current_Supplier__c</field>
        <literalValue>DriFire</literalValue>
        <name>Set Current Supplier to DriFire</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Current_Supplier_to_G_K</fullName>
        <field>Current_Supplier__c</field>
        <literalValue>G&amp;K</literalValue>
        <name>Set Current Supplier to G&amp;K</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Current_Supplier_to_Lapco</fullName>
        <field>Current_Supplier__c</field>
        <literalValue>Lapco</literalValue>
        <name>Set Current Supplier to Lapco</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Current_Supplier_to_NSA</fullName>
        <field>Current_Supplier__c</field>
        <literalValue>NSA</literalValue>
        <name>Set Current Supplier to NSA</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Current_Supplier_to_Other</fullName>
        <field>Current_Supplier__c</field>
        <literalValue>Other (enter below)</literalValue>
        <name>Set Current Supplier to Other</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Current_Supplier_to_Rasco</fullName>
        <field>Current_Supplier__c</field>
        <literalValue>Rasco</literalValue>
        <name>Set Current Supplier to Rasco</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Current_Supplier_to_Riverside</fullName>
        <field>Current_Supplier__c</field>
        <literalValue>Riverside</literalValue>
        <name>Set Current Supplier to Riverside</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Current_Supplier_to_Tyndale</fullName>
        <field>Current_Supplier__c</field>
        <literalValue>Tyndale</literalValue>
        <name>Set Current Supplier to Tyndale</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Current_Supplier_to_Unifirst</fullName>
        <field>Current_Supplier__c</field>
        <literalValue>Unifirst</literalValue>
        <name>Set Current Supplier to Unifirst</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Current_Supplier_to_Walls</fullName>
        <field>Current_Supplier__c</field>
        <literalValue>Walls</literalValue>
        <name>Set Current Supplier to Walls</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Current_Supplier_to_Workrite</fullName>
        <field>Current_Supplier__c</field>
        <literalValue>Workrite</literalValue>
        <name>Set Current Supplier to 	Workrite</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Current_Supplier_to_Wrangler</fullName>
        <field>Current_Supplier__c</field>
        <literalValue>Wrangler</literalValue>
        <name>Set Current Supplier to Wrangler</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Type_to_Direct_Customer</fullName>
        <field>Type</field>
        <literalValue>Direct Customer</literalValue>
        <name>Set Type to Direct Customer</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Type_to_End_User_Customer</fullName>
        <description>Update Type to End User Customer when an opportunity is Closed Won</description>
        <field>Type</field>
        <literalValue>End User Customer</literalValue>
        <name>Set Type to End User Customer</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <rules>
        <fullName>Annual Record Type</fullName>
        <actions>
            <name>Annual_StageName</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Create_Annual_Record_Type</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Opportunity_Type_From_Prospect__c</field>
            <operation>equals</operation>
            <value>Annual</value>
        </criteriaItems>
        <description>Creates an Annual record type upon lead conversion when Expected Opportunity type equals &quot;Annual&quot; on the lead.</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Give%2FGet Record Type</fullName>
        <actions>
            <name>Create_Give_Get_Record_Type</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Give_Get_StageName</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Opportunity_Type_From_Prospect__c</field>
            <operation>equals</operation>
            <value>Give/Get</value>
        </criteriaItems>
        <description>Creates an Give/Get record type upon lead conversion when Expected Opportunity type equals &quot;Give/Get&quot; on the lead.</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Non-Planning Cycle Record Type</fullName>
        <actions>
            <name>Create_Non_Planning_Record_Type</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Non_Planning_StageName</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Opportunity_Type_From_Prospect__c</field>
            <operation>equals</operation>
            <value>Non-Planning Cycle</value>
        </criteriaItems>
        <description>Creates an Non-Planning Cycle record type upon lead conversion when Expected Opportunity type equals &quot;Non-Planning Cycle&quot; on the lead.</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Oppty%3A Closed Lost</fullName>
        <actions>
            <name>Current_Annual_Spend</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set_Contract_End_Date_on_Acct</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set_Contract_Notes_to_Competitive_Notes</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>6 - Closed Lost</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.RecordTypeId</field>
            <operation>equals</operation>
            <value>End User Account</value>
        </criteriaItems>
        <description>For End User Accounts, update Current Annual Spend, and Contract End Date on account when an opportunity is closed won.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Oppty%3A Closed Lost to Aramark</fullName>
        <actions>
            <name>Set_Current_Supplier_to_Aramark</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>6 - Closed Lost</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.RecordTypeId</field>
            <operation>equals</operation>
            <value>End User Account</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Primary_Competitor__c</field>
            <operation>equals</operation>
            <value>Aramark</value>
        </criteriaItems>
        <description>Set Current Supplier on End User Account to Primary Competitor when opportunity is Closed Lost</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Oppty%3A Closed Lost to Bulwark</fullName>
        <actions>
            <name>Set_Current_Supplier_to_Bulwark</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>6 - Closed Lost</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.RecordTypeId</field>
            <operation>equals</operation>
            <value>End User Account</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Primary_Competitor__c</field>
            <operation>equals</operation>
            <value>Bulwark</value>
        </criteriaItems>
        <description>Set Current Supplier on End User Account to Primary Competitor when opportunity is Closed Lost</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Oppty%3A Closed Lost to Cintas</fullName>
        <actions>
            <name>Set_Current_Supplier_to_Cintas</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>6 - Closed Lost</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.RecordTypeId</field>
            <operation>equals</operation>
            <value>End User Account</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Primary_Competitor__c</field>
            <operation>equals</operation>
            <value>Cintas</value>
        </criteriaItems>
        <description>Set Current Supplier on End User Account to Primary Competitor when opportunity is Closed Lost</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Oppty%3A Closed Lost to Dakota</fullName>
        <actions>
            <name>Set_Current_Supplier_to_Dakota</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>6 - Closed Lost</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.RecordTypeId</field>
            <operation>equals</operation>
            <value>End User Account</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Primary_Competitor__c</field>
            <operation>equals</operation>
            <value>Dakota</value>
        </criteriaItems>
        <description>Set Current Supplier on End User Account to Primary Competitor when opportunity is Closed Lost</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Oppty%3A Closed Lost to DriFire</fullName>
        <actions>
            <name>Set_Current_Supplier_to_DriFire</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>6 - Closed Lost</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.RecordTypeId</field>
            <operation>equals</operation>
            <value>End User Account</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Primary_Competitor__c</field>
            <operation>equals</operation>
            <value>DriFire</value>
        </criteriaItems>
        <description>Set Current Supplier on End User Account to Primary Competitor when opportunity is Closed Lost</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Oppty%3A Closed Lost to G%26K</fullName>
        <actions>
            <name>Set_Current_Supplier_to_G_K</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>6 - Closed Lost</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.RecordTypeId</field>
            <operation>equals</operation>
            <value>End User Account</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Primary_Competitor__c</field>
            <operation>equals</operation>
            <value>G&amp;K</value>
        </criteriaItems>
        <description>Set Current Supplier on End User Account to Primary Competitor when opportunity is Closed Lost</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Oppty%3A Closed Lost to Lapco</fullName>
        <actions>
            <name>Set_Current_Supplier_to_Lapco</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>6 - Closed Lost</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.RecordTypeId</field>
            <operation>equals</operation>
            <value>End User Account</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Primary_Competitor__c</field>
            <operation>equals</operation>
            <value>Lapco</value>
        </criteriaItems>
        <description>Set Current Supplier on End User Account to Primary Competitor when opportunity is Closed Lost</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Oppty%3A Closed Lost to NSA</fullName>
        <actions>
            <name>Set_Current_Supplier_to_NSA</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>6 - Closed Lost</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.RecordTypeId</field>
            <operation>equals</operation>
            <value>End User Account</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Primary_Competitor__c</field>
            <operation>equals</operation>
            <value>NSA</value>
        </criteriaItems>
        <description>Set Current Supplier on End User Account to Primary Competitor when opportunity is Closed Lost</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Oppty%3A Closed Lost to Other</fullName>
        <actions>
            <name>Set_Current_Supplier_to_Other</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>6 - Closed Lost</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.RecordTypeId</field>
            <operation>equals</operation>
            <value>End User Account</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Primary_Competitor__c</field>
            <operation>equals</operation>
            <value>Other (enter below)</value>
        </criteriaItems>
        <description>Set Current Supplier on End User Account to Primary Competitor when opportunity is Closed Lost</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Oppty%3A Closed Lost to Rasco</fullName>
        <actions>
            <name>Set_Current_Supplier_to_Rasco</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>6 - Closed Lost</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.RecordTypeId</field>
            <operation>equals</operation>
            <value>End User Account</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Primary_Competitor__c</field>
            <operation>equals</operation>
            <value>Rasco</value>
        </criteriaItems>
        <description>Set Current Supplier on End User Account to Primary Competitor when opportunity is Closed Lost</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Oppty%3A Closed Lost to Riverside</fullName>
        <actions>
            <name>Set_Current_Supplier_to_Riverside</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>6 - Closed Lost</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.RecordTypeId</field>
            <operation>equals</operation>
            <value>End User Account</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Primary_Competitor__c</field>
            <operation>equals</operation>
            <value>Riverside</value>
        </criteriaItems>
        <description>Set Current Supplier on End User Account to Primary Competitor when opportunity is Closed Lost</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Oppty%3A Closed Lost to Tyndale</fullName>
        <actions>
            <name>Set_Current_Supplier_to_Tyndale</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>6 - Closed Lost</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.RecordTypeId</field>
            <operation>equals</operation>
            <value>End User Account</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Primary_Competitor__c</field>
            <operation>equals</operation>
            <value>Tyndale</value>
        </criteriaItems>
        <description>Set Current Supplier on End User Account to Primary Competitor when opportunity is Closed Lost</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Oppty%3A Closed Lost to Unifirst</fullName>
        <actions>
            <name>Set_Current_Supplier_to_Unifirst</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>6 - Closed Lost</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.RecordTypeId</field>
            <operation>equals</operation>
            <value>End User Account</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Primary_Competitor__c</field>
            <operation>equals</operation>
            <value>Unifirst</value>
        </criteriaItems>
        <description>Set Current Supplier on End User Account to Primary Competitor when opportunity is Closed Lost</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Oppty%3A Closed Lost to Walls</fullName>
        <actions>
            <name>Set_Current_Supplier_to_Walls</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>6 - Closed Lost</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.RecordTypeId</field>
            <operation>equals</operation>
            <value>End User Account</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Primary_Competitor__c</field>
            <operation>equals</operation>
            <value>Walls</value>
        </criteriaItems>
        <description>Set Current Supplier on End User Account to Primary Competitor when opportunity is Closed Lost</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Oppty%3A Closed Lost to Workrite</fullName>
        <actions>
            <name>Set_Current_Supplier_to_Workrite</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>6 - Closed Lost</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.RecordTypeId</field>
            <operation>equals</operation>
            <value>End User Account</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Primary_Competitor__c</field>
            <operation>equals</operation>
            <value>Workrite</value>
        </criteriaItems>
        <description>Set Current Supplier on End User Account to Primary Competitor when opportunity is Closed Lost</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Oppty%3A Closed Lost to Wrangler</fullName>
        <actions>
            <name>Set_Current_Supplier_to_Wrangler</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>6 - Closed Lost</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.RecordTypeId</field>
            <operation>equals</operation>
            <value>End User Account</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Primary_Competitor__c</field>
            <operation>equals</operation>
            <value>Wrangler</value>
        </criteriaItems>
        <description>Set Current Supplier on End User Account to Primary Competitor when opportunity is Closed Lost</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Oppty%3A Closed Won Direct</fullName>
        <actions>
            <name>Current_Annual_Spend</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set_Contract_End_Date_on_Acct</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set_Current_Supplier_to_Carhartt</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set_Type_to_Direct_Customer</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>6 - Closed Won</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.RecordTypeId</field>
            <operation>equals</operation>
            <value>End User Account</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Type</field>
            <operation>equals</operation>
            <value>Direct Prospect,Direct Customer</value>
        </criteriaItems>
        <description>For Direct Accounts, update Type, Current Supplier, Current Annual Spend, and Contract End Date on account when an opportunity is closed won.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Oppty%3A Closed Won End User</fullName>
        <actions>
            <name>Current_Annual_Spend</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set_Contract_End_Date_on_Acct</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set_Current_Supplier_to_Carhartt</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set_Type_to_End_User_Customer</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>6 - Closed Won</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.RecordTypeId</field>
            <operation>equals</operation>
            <value>End User Account</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Type</field>
            <operation>equals</operation>
            <value>End User Prospect,End User Customer</value>
        </criteriaItems>
        <description>For End User Accounts, update Current Supplier, Current Annual Spend, and Contract End Date on account when an opportunity is closed won.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Planning Cycle Record Type</fullName>
        <actions>
            <name>Create_Planning_Record_Type</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Planning_StageName</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Opportunity_Type_From_Prospect__c</field>
            <operation>equals</operation>
            <value>Planning Cycle</value>
        </criteriaItems>
        <description>Creates an Planning Cycle record type upon lead conversion when Expected Opportunity type equals &quot;Planning Cycle&quot; on the lead.</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>

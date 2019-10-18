<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Brand_Management_Case_Leadership_review_template</fullName>
        <description>Brand Management Case Leadership review template</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderAddress>noreply@carhartt.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>unfiled$public/Brand_Management_Case_Accept_template</template>
    </alerts>
    <alerts>
        <fullName>Cancel_Order</fullName>
        <description>Commitment Violation</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/SLA_Violation</template>
    </alerts>
    <alerts>
        <fullName>Commitment_Case_Closed</fullName>
        <description>Email alert when commitment case is closed</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Commitment_Case_Closed</template>
    </alerts>
    <alerts>
        <fullName>Contact_Plant</fullName>
        <description>Commitment Violation</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/SLA_Violation</template>
    </alerts>
    <alerts>
        <fullName>Credit</fullName>
        <description>Commitment Violation</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/SLA_Violation</template>
    </alerts>
    <alerts>
        <fullName>Email</fullName>
        <description>Commitment Violation</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/SLA_Violation</template>
    </alerts>
    <alerts>
        <fullName>Email_Alert</fullName>
        <description>Email alert when a new case is created.</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/New_Case_HTML</template>
    </alerts>
    <alerts>
        <fullName>Email_Alert_to_Owner</fullName>
        <description>Email Alert to Owner</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/New_Case</template>
    </alerts>
    <alerts>
        <fullName>Email_alert_for_brand_management</fullName>
        <description>Email alert for brand management</description>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <senderAddress>noreply@carhartt.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>unfiled$public/New_Case_HTML</template>
    </alerts>
    <alerts>
        <fullName>Email_for_Case_Owner_when_status_is_Leadership_Reviewed</fullName>
        <description>Email for Case Owner when status is Leadership Reviewed</description>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderAddress>noreply@carhartt.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>unfiled$public/Brand_Management_Case_Accept_template</template>
    </alerts>
    <alerts>
        <fullName>Email_for_Case_Owner_when_status_is_review_accepted</fullName>
        <description>Email for Case Owner when status is review accepted</description>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <senderAddress>noreply@carhartt.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>unfiled$public/Brand_Management_Case_Accept_template</template>
    </alerts>
    <alerts>
        <fullName>Email_for_Case_Owner_when_status_is_review_rejected</fullName>
        <description>Email for Case Owner when status is review rejected</description>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <senderAddress>noreply@carhartt.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>unfiled$public/Brand_Management_Case_Reject_template</template>
    </alerts>
    <alerts>
        <fullName>Email_for_Closed_withdrawn</fullName>
        <description>Email for Closed withdrawn</description>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <senderAddress>noreply@carhartt.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>unfiled$public/Brand_Management_Close_case_email_template</template>
    </alerts>
    <alerts>
        <fullName>Email_for_Managers</fullName>
        <description>Email for Managers</description>
        <protected>false</protected>
        <recipients>
            <recipient>vsuragani@carhartt.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>noreply@carhartt.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>unfiled$public/Retail_Case_HTML</template>
    </alerts>
    <alerts>
        <fullName>Email_for_Retailer_Public_Group</fullName>
        <description>Email for Retailer Public Group</description>
        <protected>false</protected>
        <recipients>
            <recipient>Retailer_group</recipient>
            <type>group</type>
        </recipients>
        <senderAddress>noreply@carhartt.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>unfiled$public/Retail_Case_HTML</template>
    </alerts>
    <alerts>
        <fullName>Footwear</fullName>
        <description>Commitment Violation</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/SLA_Violation</template>
    </alerts>
    <alerts>
        <fullName>Freight</fullName>
        <description>Commitment Violation</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/SLA_Violation</template>
    </alerts>
    <alerts>
        <fullName>Manual_Labels</fullName>
        <description>Commitment Violation</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/SLA_Violation</template>
    </alerts>
    <alerts>
        <fullName>Order_Mgmt</fullName>
        <description>Commitment Violation</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/SLA_Violation</template>
    </alerts>
    <alerts>
        <fullName>Phone_Call</fullName>
        <description>Commitment Violation</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/SLA_Violation</template>
    </alerts>
    <alerts>
        <fullName>Product</fullName>
        <description>Commitment Violation</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/SLA_Violation</template>
    </alerts>
    <alerts>
        <fullName>Replacement</fullName>
        <description>Commitment Violation</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/SLA_Violation</template>
    </alerts>
    <alerts>
        <fullName>Tracer</fullName>
        <description>Commitment Violation</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/SLA_Violation</template>
    </alerts>
    <fieldUpdates>
        <fullName>Commitment_Confirmed</fullName>
        <field>Commitment_Confirmed__c</field>
        <literalValue>1</literalValue>
        <name>Commitment Confirmed</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Contact_Plant</fullName>
        <field>Commitment_Confirmed__c</field>
        <literalValue>1</literalValue>
        <name>Commitment Confirmed</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Credit</fullName>
        <field>Commitment_Confirmed__c</field>
        <literalValue>1</literalValue>
        <name>Commitment Confirmed</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Email</fullName>
        <field>Commitment_Confirmed__c</field>
        <literalValue>1</literalValue>
        <name>Commitment Confirmed</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Footwear</fullName>
        <field>Commitment_Confirmed__c</field>
        <literalValue>1</literalValue>
        <name>Commitment_Confirmed</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Freight</fullName>
        <field>Commitment_Confirmed__c</field>
        <literalValue>1</literalValue>
        <name>Commitment Confirmed</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Manual_Labels</fullName>
        <field>Commitment_Confirmed__c</field>
        <literalValue>1</literalValue>
        <name>Commitment Confirmed</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Order_Mgmt</fullName>
        <field>Commitment_Confirmed__c</field>
        <literalValue>1</literalValue>
        <name>Commitment Confirmed</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Phone_Call</fullName>
        <field>Commitment_Confirmed__c</field>
        <literalValue>1</literalValue>
        <name>Commitment Confirmed</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Product</fullName>
        <field>Commitment_Confirmed__c</field>
        <literalValue>1</literalValue>
        <name>Commitment Confirmed</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Replacement</fullName>
        <field>Commitment_Confirmed__c</field>
        <literalValue>1</literalValue>
        <name>Commitment Confirmed</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Sales_Rep_Origin</fullName>
        <field>Origin</field>
        <literalValue>Sales Rep</literalValue>
        <name>Sales Rep Origin</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Tracer</fullName>
        <field>Commitment_Confirmed__c</field>
        <literalValue>1</literalValue>
        <name>Commitment Confirmed</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Brand Management Leadership review status</fullName>
        <actions>
            <name>Brand_Management_Case_Leadership_review_template</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>Whenever a case status is Leader ship review, send an email to case owner and account owner</description>
        <formula>AND(RecordType.Name = &quot;Brand Management&quot;, ISPICKVAL(Status , &apos;Leadership Reviewed&apos;) )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Case Leadership Reviewed for Brand Management Cases</fullName>
        <actions>
            <name>Email_for_Case_Owner_when_status_is_Leadership_Reviewed</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Used for when Leadership Reviewed has done for  brand management cases and trigger an email to case Owner with response</description>
        <formula>AND(RecordType.Name = &quot;Brand Management&quot;, ISPICKVAL(Status , &apos;Leadership Reviewed&apos;) )</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Case Review Accept for Brand Management Cases</fullName>
        <actions>
            <name>Email_for_Case_Owner_when_status_is_review_accepted</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Used for when sales rep accepted brand management cases trigger an email to case Owner with response as case has been accepted</description>
        <formula>AND(RecordType.Name = &quot;Brand Management&quot;, ISPICKVAL(Status , &apos;Review Accept&apos;) )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Case Review Rejected for Brand Management Cases</fullName>
        <actions>
            <name>Email_for_Case_Owner_when_status_is_review_rejected</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Used for when sales rep rejected brand management cases trigger an email to case Owner with response as case has been rejected</description>
        <formula>AND(RecordType.Name = &quot;Brand Management&quot;, ISPICKVAL(Status , &apos;Review Reject&apos;) )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Closed withdrawn for Brand Management Cases</fullName>
        <actions>
            <name>Email_for_Closed_withdrawn</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Brand Management</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>Closed – Withdrawn</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Commitment Complete</fullName>
        <actions>
            <name>Commitment_Case_Closed</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Commitment Case</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.IsClosed</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Notification sent to Commitment Case creator when marked as closed.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Email for Managers</fullName>
        <actions>
            <name>Email_for_Managers</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <formula>AND (ISPICKVAL(Status, &apos;In Progress&apos;),OR(NOT((ISBLANK( Internal_Contact1__c ))),NOT((ISBLANK( Internal_Contact2__c ))),NOT((ISBLANK( Internal_Contact3__c ))),NOT((ISBLANK( Internal_Contact4__c ))),NOT((ISBLANK( Internal_Contact5__c )))))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>New case created</fullName>
        <actions>
            <name>Email_alert_for_brand_management</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Brand Management</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>New</value>
        </criteriaItems>
        <description>New case alert for brand management cases</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Retailer Group</fullName>
        <actions>
            <name>Email_for_Retailer_Public_Group</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <formula>OR(AND(Retailer_group__c, ISNEW() ),AND(ISCHANGED(Retailer_group__c),Retailer_group__c))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Sales Rep Origin</fullName>
        <actions>
            <name>Sales_Rep_Origin</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Service_Group__c</field>
            <operation>equals</operation>
            <value>Canada,Industrial,Special Services</value>
        </criteriaItems>
        <description>Updates the Case Origin to Sales Rep when a Service Group is selected.</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>

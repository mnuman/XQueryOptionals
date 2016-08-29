(:: pragma bea:global-element-parameter parameter="$req" element="ns0:HelloWorldRequest" location="../schemas/HelloWorld.xsd" ::)
(:: pragma bea:global-element-return element="ns0:HelloWorldResponse" location="../schemas/HelloWorld.xsd" ::)

declare namespace ns0 = "http://xmlns.syntouch.nl/HelloWorld";
declare namespace xf = "http://tempuri.org/HelloWorld/transforms/DoNiftyTransforms/";

declare function xf:DoNiftyTransforms($req as element(ns0:HelloWorldRequest))
    as element(ns0:HelloWorldResponse) {
        <ns0:HelloWorldResponse>
            <ns0:Voornaam>{ data($req/ns0:FirstName) }</ns0:Voornaam>
            
            (: Usage of the construct <tagname?>{some expression}</tagname> for
               11g yields the <tagname> element only when its content - {some expression} evaluates to a non-empty value
             :)
            <ns0:Tussenvoegsel?>{ data($req/ns0:LastNamePrefix) }</ns0:Tussenvoegsel>            
            <ns0:Achternaam>{ data($req/ns0:LastName) }</ns0:Achternaam>
        </ns0:HelloWorldResponse>
};

declare variable $req as element(ns0:HelloWorldRequest) external;

xf:DoNiftyTransforms($req)

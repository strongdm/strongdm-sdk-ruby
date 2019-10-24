this_dir = File.expand_path(File.dirname(__FILE__))
lib_dir = File.join(this_dir, 'grpc')
$LOAD_PATH.unshift(lib_dir) unless $LOAD_PATH.include?(lib_dir)
require 'grpc'
require_relative './grpc/v1_plumbing'
require_relative './models/v1_porcelain'
require_relative './grpc/nodes_pb'
require_relative './grpc/nodes_services_pb'

# Nodes are proxies in strongDM responsible to communicate with servers
# (relays) and clients (gateways).

class Nodes
    def initialize(url)
        @stub = V1::Nodes::Stub.new(url, :this_channel_is_insecure)
    end
    
    def create(nodes)
        req = V1::NodeCreateRequest.new()
        req.nodes += repeated_node_to_plumbing(nodes)

        plumbing_response = @stub.create(req)

        resp = NodeCreateResponse.new()
        resp.nodes = repeated_node_to_porcelain(plumbing_response.nodes)
        resp.tokens = repeated_token_to_porcelain(plumbing_response.tokens)
        resp
    end
    
    def get()
        req = V1::NodeGetRequest.new()

        plumbing_response = @stub.get(req)

        resp = NodeGetResponse.new()
        resp
    end
    
    def update()
        req = V1::NodeUpdateRequest.new()

        plumbing_response = @stub.update(req)

        resp = NodeUpdateResponse.new()
        resp
    end
    
    def delete()
        req = V1::NodeDeleteRequest.new()

        plumbing_response = @stub.delete(req)

        resp = NodeDeleteResponse.new()
        resp
    end
    
    def list()
        req = V1::NodeListRequest.new()

        plumbing_response = @stub.list(req)

        resp = NodeListResponse.new()
        resp
    end
    
    def batch_update()
        req = V1::NodeBatchUpdateRequest.new()

        plumbing_response = @stub.batch_update(req)

        resp = NodeBatchUpdateResponse.new()
        resp
    end
    
    def batch_delete()
        req = V1::NodeBatchDeleteRequest.new()

        plumbing_response = @stub.batch_delete(req)

        resp = NodeBatchDeleteResponse.new()
        resp
    end
    
end
=begin
{
	"PackageName": "v1",
	"Services": [
		{
			"Name": "Nodes",
			"Comment": "Nodes are proxies in strongDM responsible to communicate with servers\n (relays) and clients (gateways).",
			"Methods": [
				{
					"Comment": "Create registers a new node.",
					"Name": "Create",
					"InputType": ".v1.NodeCreateRequest",
					"OutputType": ".v1.NodeCreateResponse",
					"HTTPOptions": {
						"Method": "POST",
						"URL": "/v1/nodes",
						"Body": "*",
						"ResponseBody": ""
					},
					"SwaggerOptions": {
						"Description": "",
						"Summary": "",
						"OperationID": "",
						"ExternalDocumentationDescription": "Learn how to make a Node",
						"ExternalDocumentationURL": "https://www.strongdm.com/docs/api/services/Nodes#Create",
						"Deprecated": false
					}
				},
				{
					"Comment": "Get reads one node by ID.",
					"Name": "Get",
					"InputType": ".v1.NodeGetRequest",
					"OutputType": ".v1.NodeGetResponse",
					"HTTPOptions": {
						"Method": "GET",
						"URL": "/v1/nodes/{id}",
						"Body": "",
						"ResponseBody": ""
					},
					"SwaggerOptions": {
						"Description": "",
						"Summary": "",
						"OperationID": "",
						"ExternalDocumentationDescription": "",
						"ExternalDocumentationURL": "",
						"Deprecated": false
					}
				},
				{
					"Comment": "Update patches a node by ID.",
					"Name": "Update",
					"InputType": ".v1.NodeUpdateRequest",
					"OutputType": ".v1.NodeUpdateResponse",
					"HTTPOptions": {
						"Method": "PUT",
						"URL": "/v1/nodes/{id}",
						"Body": "*",
						"ResponseBody": ""
					},
					"SwaggerOptions": {
						"Description": "",
						"Summary": "",
						"OperationID": "",
						"ExternalDocumentationDescription": "",
						"ExternalDocumentationURL": "",
						"Deprecated": false
					}
				},
				{
					"Comment": "Delete removes a node by ID.",
					"Name": "Delete",
					"InputType": ".v1.NodeDeleteRequest",
					"OutputType": ".v1.NodeDeleteResponse",
					"HTTPOptions": {
						"Method": "DELETE",
						"URL": "/v1/nodes/{id}",
						"Body": "",
						"ResponseBody": ""
					},
					"SwaggerOptions": {
						"Description": "",
						"Summary": "",
						"OperationID": "",
						"ExternalDocumentationDescription": "",
						"ExternalDocumentationURL": "",
						"Deprecated": false
					}
				},
				{
					"Comment": "List is a batched Get call.",
					"Name": "List",
					"InputType": ".v1.NodeListRequest",
					"OutputType": ".v1.NodeListResponse",
					"HTTPOptions": {
						"Method": "GET",
						"URL": "/v1/nodes",
						"Body": "",
						"ResponseBody": ""
					},
					"SwaggerOptions": {
						"Description": "",
						"Summary": "",
						"OperationID": "",
						"ExternalDocumentationDescription": "",
						"ExternalDocumentationURL": "",
						"Deprecated": false
					}
				},
				{
					"Comment": "BatchUpdate is a batched Update call.",
					"Name": "BatchUpdate",
					"InputType": ".v1.NodeBatchUpdateRequest",
					"OutputType": ".v1.NodeBatchUpdateResponse",
					"HTTPOptions": {
						"Method": "PUT",
						"URL": "/v1/nodes",
						"Body": "*",
						"ResponseBody": ""
					},
					"SwaggerOptions": {
						"Description": "",
						"Summary": "",
						"OperationID": "",
						"ExternalDocumentationDescription": "",
						"ExternalDocumentationURL": "",
						"Deprecated": false
					}
				},
				{
					"Comment": "BatchDelete is a batched Delete call.",
					"Name": "BatchDelete",
					"InputType": ".v1.NodeBatchDeleteRequest",
					"OutputType": ".v1.NodeBatchDeleteResponse",
					"HTTPOptions": {
						"Method": "DELETE",
						"URL": "/v1/nodes",
						"Body": "",
						"ResponseBody": ""
					},
					"SwaggerOptions": {
						"Description": "",
						"Summary": "",
						"OperationID": "",
						"ExternalDocumentationDescription": "",
						"ExternalDocumentationURL": "",
						"Deprecated": false
					}
				}
			]
		}
	],
	"Messages": [
		{
			"Comment": "",
			"Name": "FieldOptions",
			"Fields": [
				{
					"Comment": "",
					"Name": "name",
					"Type": {
						"Ref": "",
						"Primitive": "TYPE_STRING"
					},
					"JSONName": "name",
					"Repeated": false,
					"ModelOptions": {
						"Name": "",
						"Nullable": false,
						"ExposeAsPorcelain": false
					}
				},
				{
					"Comment": "",
					"Name": "sql_nullable",
					"Type": {
						"Ref": "",
						"Primitive": "TYPE_BOOL"
					},
					"JSONName": "sqlNullable",
					"Repeated": false,
					"ModelOptions": {
						"Name": "",
						"Nullable": false,
						"ExposeAsPorcelain": false
					}
				},
				{
					"Comment": "",
					"Name": "expose_as_porcelain",
					"Type": {
						"Ref": "",
						"Primitive": "TYPE_BOOL"
					},
					"JSONName": "exposeAsPorcelain",
					"Repeated": false,
					"ModelOptions": {
						"Name": "",
						"Nullable": false,
						"ExposeAsPorcelain": false
					}
				}
			],
			"Oneofs": null,
			"SwaggerOptions": {
				"ExternalDocumentationDescription": "",
				"ExternalDocumentationURL": "",
				"Example": ""
			},
			"ModelOptions": {
				"Name": "",
				"Porcelain": false
			}
		},
		{
			"Comment": "",
			"Name": "MessageOptions",
			"Fields": [
				{
					"Comment": "",
					"Name": "model_name",
					"Type": {
						"Ref": "",
						"Primitive": "TYPE_STRING"
					},
					"JSONName": "modelName",
					"Repeated": false,
					"ModelOptions": {
						"Name": "",
						"Nullable": false,
						"ExposeAsPorcelain": false
					}
				},
				{
					"Comment": "",
					"Name": "porcelain",
					"Type": {
						"Ref": "",
						"Primitive": "TYPE_BOOL"
					},
					"JSONName": "porcelain",
					"Repeated": false,
					"ModelOptions": {
						"Name": "",
						"Nullable": false,
						"ExposeAsPorcelain": false
					}
				}
			],
			"Oneofs": null,
			"SwaggerOptions": {
				"ExternalDocumentationDescription": "",
				"ExternalDocumentationURL": "",
				"Example": ""
			},
			"ModelOptions": {
				"Name": "",
				"Porcelain": false
			}
		},
		{
			"Comment": "",
			"Name": "OneofOptions",
			"Fields": [
				{
					"Comment": "",
					"Name": "model_name",
					"Type": {
						"Ref": "",
						"Primitive": "TYPE_STRING"
					},
					"JSONName": "modelName",
					"Repeated": false,
					"ModelOptions": {
						"Name": "",
						"Nullable": false,
						"ExposeAsPorcelain": false
					}
				}
			],
			"Oneofs": null,
			"SwaggerOptions": {
				"ExternalDocumentationDescription": "",
				"ExternalDocumentationURL": "",
				"Example": ""
			},
			"ModelOptions": {
				"Name": "",
				"Porcelain": false
			}
		},
		{
			"Comment": "",
			"Name": "ErrorDetail",
			"Fields": [
				{
					"Comment": "",
					"Name": "message",
					"Type": {
						"Ref": "",
						"Primitive": "TYPE_STRING"
					},
					"JSONName": "message",
					"Repeated": false,
					"ModelOptions": {
						"Name": "",
						"Nullable": false,
						"ExposeAsPorcelain": false
					}
				}
			],
			"Oneofs": null,
			"SwaggerOptions": {
				"ExternalDocumentationDescription": "",
				"ExternalDocumentationURL": "",
				"Example": ""
			},
			"ModelOptions": {
				"Name": "",
				"Porcelain": false
			}
		},
		{
			"Comment": "CreateRequestMetadata",
			"Name": "CreateRequestMetadata",
			"Fields": null,
			"Oneofs": null,
			"SwaggerOptions": {
				"ExternalDocumentationDescription": "",
				"ExternalDocumentationURL": "",
				"Example": ""
			},
			"ModelOptions": {
				"Name": "",
				"Porcelain": false
			}
		},
		{
			"Comment": "CreateResponseMetadata",
			"Name": "CreateResponseMetadata",
			"Fields": [
				{
					"Comment": "",
					"Name": "affected",
					"Type": {
						"Ref": "",
						"Primitive": "TYPE_INT64"
					},
					"JSONName": "affected",
					"Repeated": false,
					"ModelOptions": {
						"Name": "",
						"Nullable": false,
						"ExposeAsPorcelain": false
					}
				}
			],
			"Oneofs": null,
			"SwaggerOptions": {
				"ExternalDocumentationDescription": "",
				"ExternalDocumentationURL": "",
				"Example": ""
			},
			"ModelOptions": {
				"Name": "",
				"Porcelain": false
			}
		},
		{
			"Comment": "GetRequestMetadata",
			"Name": "GetRequestMetadata",
			"Fields": null,
			"Oneofs": null,
			"SwaggerOptions": {
				"ExternalDocumentationDescription": "",
				"ExternalDocumentationURL": "",
				"Example": ""
			},
			"ModelOptions": {
				"Name": "",
				"Porcelain": false
			}
		},
		{
			"Comment": "GetResponseMetadata",
			"Name": "GetResponseMetadata",
			"Fields": [
				{
					"Comment": "",
					"Name": "found",
					"Type": {
						"Ref": "",
						"Primitive": "TYPE_INT64"
					},
					"JSONName": "found",
					"Repeated": false,
					"ModelOptions": {
						"Name": "",
						"Nullable": false,
						"ExposeAsPorcelain": false
					}
				}
			],
			"Oneofs": null,
			"SwaggerOptions": {
				"ExternalDocumentationDescription": "",
				"ExternalDocumentationURL": "",
				"Example": ""
			},
			"ModelOptions": {
				"Name": "",
				"Porcelain": false
			}
		},
		{
			"Comment": "UpdateRequestMetadata",
			"Name": "UpdateRequestMetadata",
			"Fields": null,
			"Oneofs": null,
			"SwaggerOptions": {
				"ExternalDocumentationDescription": "",
				"ExternalDocumentationURL": "",
				"Example": ""
			},
			"ModelOptions": {
				"Name": "",
				"Porcelain": false
			}
		},
		{
			"Comment": "UpdateResponseMetadata",
			"Name": "UpdateResponseMetadata",
			"Fields": [
				{
					"Comment": "",
					"Name": "affected",
					"Type": {
						"Ref": "",
						"Primitive": "TYPE_INT64"
					},
					"JSONName": "affected",
					"Repeated": false,
					"ModelOptions": {
						"Name": "",
						"Nullable": false,
						"ExposeAsPorcelain": false
					}
				}
			],
			"Oneofs": null,
			"SwaggerOptions": {
				"ExternalDocumentationDescription": "",
				"ExternalDocumentationURL": "",
				"Example": ""
			},
			"ModelOptions": {
				"Name": "",
				"Porcelain": false
			}
		},
		{
			"Comment": "DeleteRequestMetadata",
			"Name": "DeleteRequestMetadata",
			"Fields": null,
			"Oneofs": null,
			"SwaggerOptions": {
				"ExternalDocumentationDescription": "",
				"ExternalDocumentationURL": "",
				"Example": ""
			},
			"ModelOptions": {
				"Name": "",
				"Porcelain": false
			}
		},
		{
			"Comment": "DeleteResponseMetadata",
			"Name": "DeleteResponseMetadata",
			"Fields": [
				{
					"Comment": "",
					"Name": "affected",
					"Type": {
						"Ref": "",
						"Primitive": "TYPE_INT64"
					},
					"JSONName": "affected",
					"Repeated": false,
					"ModelOptions": {
						"Name": "",
						"Nullable": false,
						"ExposeAsPorcelain": false
					}
				}
			],
			"Oneofs": null,
			"SwaggerOptions": {
				"ExternalDocumentationDescription": "",
				"ExternalDocumentationURL": "",
				"Example": ""
			},
			"ModelOptions": {
				"Name": "",
				"Porcelain": false
			}
		},
		{
			"Comment": "BatchUpdateRequestMetadata",
			"Name": "BatchUpdateRequestMetadata",
			"Fields": null,
			"Oneofs": null,
			"SwaggerOptions": {
				"ExternalDocumentationDescription": "",
				"ExternalDocumentationURL": "",
				"Example": ""
			},
			"ModelOptions": {
				"Name": "",
				"Porcelain": false
			}
		},
		{
			"Comment": "BatchUpdateResponseMetadata",
			"Name": "BatchUpdateResponseMetadata",
			"Fields": [
				{
					"Comment": "",
					"Name": "found",
					"Type": {
						"Ref": "",
						"Primitive": "TYPE_INT64"
					},
					"JSONName": "found",
					"Repeated": false,
					"ModelOptions": {
						"Name": "",
						"Nullable": false,
						"ExposeAsPorcelain": false
					}
				},
				{
					"Comment": "",
					"Name": "affected",
					"Type": {
						"Ref": "",
						"Primitive": "TYPE_INT64"
					},
					"JSONName": "affected",
					"Repeated": false,
					"ModelOptions": {
						"Name": "",
						"Nullable": false,
						"ExposeAsPorcelain": false
					}
				}
			],
			"Oneofs": null,
			"SwaggerOptions": {
				"ExternalDocumentationDescription": "",
				"ExternalDocumentationURL": "",
				"Example": ""
			},
			"ModelOptions": {
				"Name": "",
				"Porcelain": false
			}
		},
		{
			"Comment": "BatchDeleteRequestMetadata",
			"Name": "BatchDeleteRequestMetadata",
			"Fields": null,
			"Oneofs": null,
			"SwaggerOptions": {
				"ExternalDocumentationDescription": "",
				"ExternalDocumentationURL": "",
				"Example": ""
			},
			"ModelOptions": {
				"Name": "",
				"Porcelain": false
			}
		},
		{
			"Comment": "BatchDeleteResponseMetadata",
			"Name": "BatchDeleteResponseMetadata",
			"Fields": [
				{
					"Comment": "",
					"Name": "found",
					"Type": {
						"Ref": "",
						"Primitive": "TYPE_INT64"
					},
					"JSONName": "found",
					"Repeated": false,
					"ModelOptions": {
						"Name": "",
						"Nullable": false,
						"ExposeAsPorcelain": false
					}
				},
				{
					"Comment": "",
					"Name": "affected",
					"Type": {
						"Ref": "",
						"Primitive": "TYPE_INT64"
					},
					"JSONName": "affected",
					"Repeated": false,
					"ModelOptions": {
						"Name": "",
						"Nullable": false,
						"ExposeAsPorcelain": false
					}
				}
			],
			"Oneofs": null,
			"SwaggerOptions": {
				"ExternalDocumentationDescription": "",
				"ExternalDocumentationURL": "",
				"Example": ""
			},
			"ModelOptions": {
				"Name": "",
				"Porcelain": false
			}
		},
		{
			"Comment": "ListRequestMetadata",
			"Name": "ListRequestMetadata",
			"Fields": [
				{
					"Comment": "",
					"Name": "page",
					"Type": {
						"Ref": "",
						"Primitive": "TYPE_STRING"
					},
					"JSONName": "page",
					"Repeated": false,
					"ModelOptions": {
						"Name": "",
						"Nullable": false,
						"ExposeAsPorcelain": false
					}
				}
			],
			"Oneofs": null,
			"SwaggerOptions": {
				"ExternalDocumentationDescription": "",
				"ExternalDocumentationURL": "",
				"Example": ""
			},
			"ModelOptions": {
				"Name": "",
				"Porcelain": false
			}
		},
		{
			"Comment": "ListResponseMetadata",
			"Name": "ListResponseMetadata",
			"Fields": [
				{
					"Comment": "",
					"Name": "next_page",
					"Type": {
						"Ref": "",
						"Primitive": "TYPE_STRING"
					},
					"JSONName": "nextPage",
					"Repeated": false,
					"ModelOptions": {
						"Name": "",
						"Nullable": false,
						"ExposeAsPorcelain": false
					}
				},
				{
					"Comment": "",
					"Name": "found",
					"Type": {
						"Ref": "",
						"Primitive": "TYPE_INT64"
					},
					"JSONName": "found",
					"Repeated": false,
					"ModelOptions": {
						"Name": "",
						"Nullable": false,
						"ExposeAsPorcelain": false
					}
				}
			],
			"Oneofs": null,
			"SwaggerOptions": {
				"ExternalDocumentationDescription": "",
				"ExternalDocumentationURL": "",
				"Example": ""
			},
			"ModelOptions": {
				"Name": "",
				"Porcelain": false
			}
		},
		{
			"Comment": "NodeCreateRequest specifies what kind of nodes that should be registered in\n the organizations fleet. Note that a node must be either a Relay or a\n Gateway.",
			"Name": "NodeCreateRequest",
			"Fields": [
				{
					"Comment": "",
					"Name": "meta",
					"Type": {
						"Ref": ".v1.CreateRequestMetadata",
						"Primitive": "TYPE_MESSAGE"
					},
					"JSONName": "meta",
					"Repeated": false,
					"ModelOptions": {
						"Name": "",
						"Nullable": false,
						"ExposeAsPorcelain": false
					}
				},
				{
					"Comment": "",
					"Name": "nodes",
					"Type": {
						"Ref": ".v1.Node",
						"Primitive": "TYPE_MESSAGE"
					},
					"JSONName": "nodes",
					"Repeated": true,
					"ModelOptions": {
						"Name": "",
						"Nullable": false,
						"ExposeAsPorcelain": true
					}
				}
			],
			"Oneofs": null,
			"SwaggerOptions": {
				"ExternalDocumentationDescription": "",
				"ExternalDocumentationURL": "",
				"Example": ""
			},
			"ModelOptions": {
				"Name": "",
				"Porcelain": false
			}
		},
		{
			"Comment": "NodeCreateResponse reports how the nodes were created in the system. It can\n communicate partial successes or failures.",
			"Name": "NodeCreateResponse",
			"Fields": [
				{
					"Comment": "",
					"Name": "meta",
					"Type": {
						"Ref": ".v1.CreateResponseMetadata",
						"Primitive": "TYPE_MESSAGE"
					},
					"JSONName": "meta",
					"Repeated": false,
					"ModelOptions": {
						"Name": "",
						"Nullable": false,
						"ExposeAsPorcelain": false
					}
				},
				{
					"Comment": "",
					"Name": "nodes",
					"Type": {
						"Ref": ".v1.Node",
						"Primitive": "TYPE_MESSAGE"
					},
					"JSONName": "nodes",
					"Repeated": true,
					"ModelOptions": {
						"Name": "",
						"Nullable": false,
						"ExposeAsPorcelain": true
					}
				},
				{
					"Comment": "",
					"Name": "tokens",
					"Type": {
						"Ref": ".v1.Token",
						"Primitive": "TYPE_MESSAGE"
					},
					"JSONName": "tokens",
					"Repeated": true,
					"ModelOptions": {
						"Name": "",
						"Nullable": false,
						"ExposeAsPorcelain": true
					}
				}
			],
			"Oneofs": null,
			"SwaggerOptions": {
				"ExternalDocumentationDescription": "",
				"ExternalDocumentationURL": "",
				"Example": ""
			},
			"ModelOptions": {
				"Name": "",
				"Porcelain": true
			}
		},
		{
			"Comment": "NodeGetRequest specifies which node to retrieve.",
			"Name": "NodeGetRequest",
			"Fields": [
				{
					"Comment": "",
					"Name": "meta",
					"Type": {
						"Ref": ".v1.GetRequestMetadata",
						"Primitive": "TYPE_MESSAGE"
					},
					"JSONName": "meta",
					"Repeated": false,
					"ModelOptions": {
						"Name": "",
						"Nullable": false,
						"ExposeAsPorcelain": false
					}
				},
				{
					"Comment": "",
					"Name": "id",
					"Type": {
						"Ref": "",
						"Primitive": "TYPE_STRING"
					},
					"JSONName": "id",
					"Repeated": false,
					"ModelOptions": {
						"Name": "",
						"Nullable": false,
						"ExposeAsPorcelain": false
					}
				}
			],
			"Oneofs": null,
			"SwaggerOptions": {
				"ExternalDocumentationDescription": "",
				"ExternalDocumentationURL": "",
				"Example": ""
			},
			"ModelOptions": {
				"Name": "",
				"Porcelain": false
			}
		},
		{
			"Comment": "NodeGetResponse returns a requested node.",
			"Name": "NodeGetResponse",
			"Fields": [
				{
					"Comment": "",
					"Name": "meta",
					"Type": {
						"Ref": ".v1.GetResponseMetadata",
						"Primitive": "TYPE_MESSAGE"
					},
					"JSONName": "meta",
					"Repeated": false,
					"ModelOptions": {
						"Name": "",
						"Nullable": false,
						"ExposeAsPorcelain": false
					}
				},
				{
					"Comment": "",
					"Name": "node",
					"Type": {
						"Ref": ".v1.Node",
						"Primitive": "TYPE_MESSAGE"
					},
					"JSONName": "node",
					"Repeated": false,
					"ModelOptions": {
						"Name": "",
						"Nullable": false,
						"ExposeAsPorcelain": false
					}
				}
			],
			"Oneofs": null,
			"SwaggerOptions": {
				"ExternalDocumentationDescription": "",
				"ExternalDocumentationURL": "",
				"Example": ""
			},
			"ModelOptions": {
				"Name": "",
				"Porcelain": false
			}
		},
		{
			"Comment": "NodeUpdateRequest identifies a node by ID and provides fields to update on\n that node record.",
			"Name": "NodeUpdateRequest",
			"Fields": [
				{
					"Comment": "",
					"Name": "meta",
					"Type": {
						"Ref": ".v1.UpdateRequestMetadata",
						"Primitive": "TYPE_MESSAGE"
					},
					"JSONName": "meta",
					"Repeated": false,
					"ModelOptions": {
						"Name": "",
						"Nullable": false,
						"ExposeAsPorcelain": false
					}
				},
				{
					"Comment": "",
					"Name": "id",
					"Type": {
						"Ref": "",
						"Primitive": "TYPE_STRING"
					},
					"JSONName": "id",
					"Repeated": false,
					"ModelOptions": {
						"Name": "",
						"Nullable": false,
						"ExposeAsPorcelain": false
					}
				},
				{
					"Comment": "",
					"Name": "node",
					"Type": {
						"Ref": ".v1.Node",
						"Primitive": "TYPE_MESSAGE"
					},
					"JSONName": "node",
					"Repeated": false,
					"ModelOptions": {
						"Name": "",
						"Nullable": false,
						"ExposeAsPorcelain": false
					}
				}
			],
			"Oneofs": null,
			"SwaggerOptions": {
				"ExternalDocumentationDescription": "",
				"ExternalDocumentationURL": "",
				"Example": ""
			},
			"ModelOptions": {
				"Name": "",
				"Porcelain": false
			}
		},
		{
			"Comment": "NodeUpdateResponse returns the fields of a node after it has been updated by\n a NodeUpdateRequest.",
			"Name": "NodeUpdateResponse",
			"Fields": [
				{
					"Comment": "",
					"Name": "meta",
					"Type": {
						"Ref": ".v1.UpdateResponseMetadata",
						"Primitive": "TYPE_MESSAGE"
					},
					"JSONName": "meta",
					"Repeated": false,
					"ModelOptions": {
						"Name": "",
						"Nullable": false,
						"ExposeAsPorcelain": false
					}
				},
				{
					"Comment": "",
					"Name": "node",
					"Type": {
						"Ref": ".v1.Node",
						"Primitive": "TYPE_MESSAGE"
					},
					"JSONName": "node",
					"Repeated": false,
					"ModelOptions": {
						"Name": "",
						"Nullable": false,
						"ExposeAsPorcelain": false
					}
				}
			],
			"Oneofs": null,
			"SwaggerOptions": {
				"ExternalDocumentationDescription": "",
				"ExternalDocumentationURL": "",
				"Example": ""
			},
			"ModelOptions": {
				"Name": "",
				"Porcelain": false
			}
		},
		{
			"Comment": "NodeDeleteRequest identifies a node by ID to delete.",
			"Name": "NodeDeleteRequest",
			"Fields": [
				{
					"Comment": "",
					"Name": "meta",
					"Type": {
						"Ref": ".v1.DeleteRequestMetadata",
						"Primitive": "TYPE_MESSAGE"
					},
					"JSONName": "meta",
					"Repeated": false,
					"ModelOptions": {
						"Name": "",
						"Nullable": false,
						"ExposeAsPorcelain": false
					}
				},
				{
					"Comment": "",
					"Name": "id",
					"Type": {
						"Ref": "",
						"Primitive": "TYPE_STRING"
					},
					"JSONName": "id",
					"Repeated": false,
					"ModelOptions": {
						"Name": "",
						"Nullable": false,
						"ExposeAsPorcelain": false
					}
				}
			],
			"Oneofs": null,
			"SwaggerOptions": {
				"ExternalDocumentationDescription": "",
				"ExternalDocumentationURL": "",
				"Example": ""
			},
			"ModelOptions": {
				"Name": "",
				"Porcelain": false
			}
		},
		{
			"Comment": "NodeDeleteResponse returns information about a node that was deleted.",
			"Name": "NodeDeleteResponse",
			"Fields": [
				{
					"Comment": "",
					"Name": "meta",
					"Type": {
						"Ref": ".v1.DeleteResponseMetadata",
						"Primitive": "TYPE_MESSAGE"
					},
					"JSONName": "meta",
					"Repeated": false,
					"ModelOptions": {
						"Name": "",
						"Nullable": false,
						"ExposeAsPorcelain": false
					}
				}
			],
			"Oneofs": null,
			"SwaggerOptions": {
				"ExternalDocumentationDescription": "",
				"ExternalDocumentationURL": "",
				"Example": ""
			},
			"ModelOptions": {
				"Name": "",
				"Porcelain": false
			}
		},
		{
			"Comment": "NodeListRequest specifies criteria for retrieving a list of nodes.",
			"Name": "NodeListRequest",
			"Fields": [
				{
					"Comment": "",
					"Name": "meta",
					"Type": {
						"Ref": ".v1.ListRequestMetadata",
						"Primitive": "TYPE_MESSAGE"
					},
					"JSONName": "meta",
					"Repeated": false,
					"ModelOptions": {
						"Name": "",
						"Nullable": false,
						"ExposeAsPorcelain": false
					}
				},
				{
					"Comment": "",
					"Name": "filter",
					"Type": {
						"Ref": "",
						"Primitive": "TYPE_STRING"
					},
					"JSONName": "filter",
					"Repeated": false,
					"ModelOptions": {
						"Name": "",
						"Nullable": false,
						"ExposeAsPorcelain": false
					}
				}
			],
			"Oneofs": null,
			"SwaggerOptions": {
				"ExternalDocumentationDescription": "",
				"ExternalDocumentationURL": "",
				"Example": ""
			},
			"ModelOptions": {
				"Name": "",
				"Porcelain": false
			}
		},
		{
			"Comment": "NodeListResponse returns a list of nodes that meet the criteria of a\n NodeListRequest.",
			"Name": "NodeListResponse",
			"Fields": [
				{
					"Comment": "",
					"Name": "meta",
					"Type": {
						"Ref": ".v1.ListResponseMetadata",
						"Primitive": "TYPE_MESSAGE"
					},
					"JSONName": "meta",
					"Repeated": false,
					"ModelOptions": {
						"Name": "",
						"Nullable": false,
						"ExposeAsPorcelain": false
					}
				},
				{
					"Comment": "",
					"Name": "nodes",
					"Type": {
						"Ref": ".v1.Node",
						"Primitive": "TYPE_MESSAGE"
					},
					"JSONName": "nodes",
					"Repeated": true,
					"ModelOptions": {
						"Name": "",
						"Nullable": false,
						"ExposeAsPorcelain": false
					}
				}
			],
			"Oneofs": null,
			"SwaggerOptions": {
				"ExternalDocumentationDescription": "",
				"ExternalDocumentationURL": "",
				"Example": ""
			},
			"ModelOptions": {
				"Name": "",
				"Porcelain": false
			}
		},
		{
			"Comment": "NodeBatchUpdateRequest specifies a list of nodes and fields to update within\n those nodes.",
			"Name": "NodeBatchUpdateRequest",
			"Fields": [
				{
					"Comment": "",
					"Name": "meta",
					"Type": {
						"Ref": ".v1.BatchUpdateRequestMetadata",
						"Primitive": "TYPE_MESSAGE"
					},
					"JSONName": "meta",
					"Repeated": false,
					"ModelOptions": {
						"Name": "",
						"Nullable": false,
						"ExposeAsPorcelain": false
					}
				},
				{
					"Comment": "",
					"Name": "nodes",
					"Type": {
						"Ref": ".v1.Node",
						"Primitive": "TYPE_MESSAGE"
					},
					"JSONName": "nodes",
					"Repeated": true,
					"ModelOptions": {
						"Name": "",
						"Nullable": false,
						"ExposeAsPorcelain": false
					}
				}
			],
			"Oneofs": null,
			"SwaggerOptions": {
				"ExternalDocumentationDescription": "",
				"ExternalDocumentationURL": "",
				"Example": ""
			},
			"ModelOptions": {
				"Name": "",
				"Porcelain": false
			}
		},
		{
			"Comment": "NodeBatchUpdateResponse returns a list of nodes updated via\n NodeBatchUpdateRequest.",
			"Name": "NodeBatchUpdateResponse",
			"Fields": [
				{
					"Comment": "",
					"Name": "meta",
					"Type": {
						"Ref": ".v1.BatchUpdateResponseMetadata",
						"Primitive": "TYPE_MESSAGE"
					},
					"JSONName": "meta",
					"Repeated": false,
					"ModelOptions": {
						"Name": "",
						"Nullable": false,
						"ExposeAsPorcelain": false
					}
				},
				{
					"Comment": "",
					"Name": "nodes",
					"Type": {
						"Ref": ".v1.Node",
						"Primitive": "TYPE_MESSAGE"
					},
					"JSONName": "nodes",
					"Repeated": true,
					"ModelOptions": {
						"Name": "",
						"Nullable": false,
						"ExposeAsPorcelain": false
					}
				}
			],
			"Oneofs": null,
			"SwaggerOptions": {
				"ExternalDocumentationDescription": "",
				"ExternalDocumentationURL": "",
				"Example": ""
			},
			"ModelOptions": {
				"Name": "",
				"Porcelain": false
			}
		},
		{
			"Comment": "NodeBatchDeleteRequest specifies a list of nodes to delete by ID.",
			"Name": "NodeBatchDeleteRequest",
			"Fields": [
				{
					"Comment": "",
					"Name": "meta",
					"Type": {
						"Ref": ".v1.BatchDeleteRequestMetadata",
						"Primitive": "TYPE_MESSAGE"
					},
					"JSONName": "meta",
					"Repeated": false,
					"ModelOptions": {
						"Name": "",
						"Nullable": false,
						"ExposeAsPorcelain": false
					}
				},
				{
					"Comment": "",
					"Name": "ids",
					"Type": {
						"Ref": "",
						"Primitive": "TYPE_STRING"
					},
					"JSONName": "ids",
					"Repeated": true,
					"ModelOptions": {
						"Name": "",
						"Nullable": false,
						"ExposeAsPorcelain": false
					}
				}
			],
			"Oneofs": null,
			"SwaggerOptions": {
				"ExternalDocumentationDescription": "",
				"ExternalDocumentationURL": "",
				"Example": ""
			},
			"ModelOptions": {
				"Name": "",
				"Porcelain": false
			}
		},
		{
			"Comment": "NodeBatchDeleteResponse returns information about nodes deleted via a\n NodeBatchDeleteRequest.",
			"Name": "NodeBatchDeleteResponse",
			"Fields": [
				{
					"Comment": "",
					"Name": "meta",
					"Type": {
						"Ref": ".v1.BatchDeleteResponseMetadata",
						"Primitive": "TYPE_MESSAGE"
					},
					"JSONName": "meta",
					"Repeated": false,
					"ModelOptions": {
						"Name": "",
						"Nullable": false,
						"ExposeAsPorcelain": false
					}
				}
			],
			"Oneofs": null,
			"SwaggerOptions": {
				"ExternalDocumentationDescription": "",
				"ExternalDocumentationURL": "",
				"Example": ""
			},
			"ModelOptions": {
				"Name": "",
				"Porcelain": false
			}
		},
		{
			"Comment": "Node is a domain object (either a relay or a gateway).",
			"Name": "Node",
			"Fields": [
				{
					"Comment": "",
					"Name": "relay",
					"Type": {
						"Ref": ".v1.Relay",
						"Primitive": "TYPE_MESSAGE"
					},
					"JSONName": "relay",
					"Repeated": false,
					"ModelOptions": {
						"Name": "",
						"Nullable": false,
						"ExposeAsPorcelain": false
					}
				},
				{
					"Comment": "",
					"Name": "gateway",
					"Type": {
						"Ref": ".v1.Gateway",
						"Primitive": "TYPE_MESSAGE"
					},
					"JSONName": "gateway",
					"Repeated": false,
					"ModelOptions": {
						"Name": "",
						"Nullable": false,
						"ExposeAsPorcelain": false
					}
				}
			],
			"Oneofs": [
				{
					"Name": "node",
					"ModelName": "Node",
					"Fields": [
						{
							"Name": "relay",
							"Type": {
								"Ref": ".v1.Relay",
								"Primitive": "TYPE_MESSAGE"
							}
						},
						{
							"Name": "gateway",
							"Type": {
								"Ref": ".v1.Gateway",
								"Primitive": "TYPE_MESSAGE"
							}
						}
					]
				}
			],
			"SwaggerOptions": {
				"ExternalDocumentationDescription": "A node.",
				"ExternalDocumentationURL": "https://www.strongdm.com/docs/api/entities#Node",
				"Example": "value:\"{ \\\"id\\\": \\\"7\\\", \\\"name\\\": \\\"happy-goat\\\"}\" "
			},
			"ModelOptions": {
				"Name": "",
				"Porcelain": true
			}
		},
		{
			"Comment": "Relay represents a StrongDM CLI installation running in relay mode.",
			"Name": "Relay",
			"Fields": [
				{
					"Comment": "",
					"Name": "id",
					"Type": {
						"Ref": "",
						"Primitive": "TYPE_STRING"
					},
					"JSONName": "id",
					"Repeated": false,
					"ModelOptions": {
						"Name": "ID",
						"Nullable": false,
						"ExposeAsPorcelain": false
					}
				},
				{
					"Comment": "",
					"Name": "name",
					"Type": {
						"Ref": "",
						"Primitive": "TYPE_STRING"
					},
					"JSONName": "name",
					"Repeated": false,
					"ModelOptions": {
						"Name": "Name",
						"Nullable": false,
						"ExposeAsPorcelain": false
					}
				}
			],
			"Oneofs": null,
			"SwaggerOptions": {
				"ExternalDocumentationDescription": "",
				"ExternalDocumentationURL": "",
				"Example": ""
			},
			"ModelOptions": {
				"Name": "Node",
				"Porcelain": true
			}
		},
		{
			"Comment": "Gateway represents a StrongDM CLI installation running in gateway mode.",
			"Name": "Gateway",
			"Fields": [
				{
					"Comment": "",
					"Name": "id",
					"Type": {
						"Ref": "",
						"Primitive": "TYPE_STRING"
					},
					"JSONName": "id",
					"Repeated": false,
					"ModelOptions": {
						"Name": "ID",
						"Nullable": false,
						"ExposeAsPorcelain": false
					}
				},
				{
					"Comment": "",
					"Name": "name",
					"Type": {
						"Ref": "",
						"Primitive": "TYPE_STRING"
					},
					"JSONName": "name",
					"Repeated": false,
					"ModelOptions": {
						"Name": "Name",
						"Nullable": false,
						"ExposeAsPorcelain": false
					}
				},
				{
					"Comment": "",
					"Name": "listen_address",
					"Type": {
						"Ref": "",
						"Primitive": "TYPE_STRING"
					},
					"JSONName": "listenAddress",
					"Repeated": false,
					"ModelOptions": {
						"Name": "ListenAddr",
						"Nullable": true,
						"ExposeAsPorcelain": false
					}
				},
				{
					"Comment": "",
					"Name": "bind_address",
					"Type": {
						"Ref": "",
						"Primitive": "TYPE_STRING"
					},
					"JSONName": "bindAddress",
					"Repeated": false,
					"ModelOptions": {
						"Name": "BindAddr",
						"Nullable": true,
						"ExposeAsPorcelain": false
					}
				}
			],
			"Oneofs": null,
			"SwaggerOptions": {
				"ExternalDocumentationDescription": "",
				"ExternalDocumentationURL": "",
				"Example": ""
			},
			"ModelOptions": {
				"Name": "Node",
				"Porcelain": true
			}
		},
		{
			"Comment": "Token holds the bearer token used to start up nodes.",
			"Name": "Token",
			"Fields": [
				{
					"Comment": "",
					"Name": "id",
					"Type": {
						"Ref": "",
						"Primitive": "TYPE_STRING"
					},
					"JSONName": "id",
					"Repeated": false,
					"ModelOptions": {
						"Name": "",
						"Nullable": false,
						"ExposeAsPorcelain": false
					}
				},
				{
					"Comment": "",
					"Name": "token",
					"Type": {
						"Ref": "",
						"Primitive": "TYPE_STRING"
					},
					"JSONName": "token",
					"Repeated": false,
					"ModelOptions": {
						"Name": "",
						"Nullable": false,
						"ExposeAsPorcelain": false
					}
				}
			],
			"Oneofs": null,
			"SwaggerOptions": {
				"ExternalDocumentationDescription": "",
				"ExternalDocumentationURL": "",
				"Example": ""
			},
			"ModelOptions": {
				"Name": "",
				"Porcelain": true
			}
		}
	],
	"Swagger": {
		"Host": "app.strongdm.com",
		"BasePath": ""
	}
}

=end

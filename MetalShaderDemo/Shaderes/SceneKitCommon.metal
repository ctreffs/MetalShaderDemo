//
//  SceneKitCommon.metal
//  MetalShaderDemo
//
//  Created by M.Ike on 2016/09/07.
//  Copyright © 2016年 M.Ike. All rights reserved.
//

#include <metal_stdlib>
using namespace metal;
#include <SceneKit/scn_metal>

// 頂点属性
struct GenericVertexInput {
    float4 position [[ attribute(SCNVertexSemanticPosition) ]];
    float2 texcoord [[ attribute(SCNVertexSemanticTexcoord0) ]];
    float4 normal   [[ attribute(SCNVertexSemanticNormal) ]];
};

// モデルデータ
struct GenericNodeBuffer {
    float4x4 modelViewProjectionTransform;
    float4x4 normalTransform; // Inverse transpose of modelViewTransform
    float4x4 inverseModelTransform;
};

struct GenericLightData {
    float4 lightWorldPosition;
    float4 eyeWorldPosition;
    float3 color;
};

//struct GenericMaterialData {
//    float4 diffuse;
//    float4 specular;
//    float shininess;
//    float4 emmision;
//
//    // CookTorrance(microfacet)
//    float roughness;
//};

struct GenericVertexOut {
    float4 position [[position]];
    float2 texcoord;
    float4 ambient;
    float3 normal;
    float3 light;
    float3 eye;
};


//
//  ShaderCommon.swift
//  MetalShaderDemo
//
//  Created by M.Ike on 2016/09/04.
//  Copyright © 2016年 M.Ike. All rights reserved.
//

import SceneKit

// MARK: -

struct LightData {
    var lightPosition: float3
    var eyePosition: float3
    var color: float4
}

struct MaterialData {
    var diffuse: float4
    var specular: float4
    var shininess: Float
    var emission: float4
    
    var roughness: Float
    
    private let padding = [UInt8](repeating: 0, count: 12)
}

// MARK: -
typealias ColorProperty = ValueProperty<float4>
typealias LightProperty = ValueProperty<LightData>
typealias MaterialProperty = ValueProperty<MaterialData>


// MARK: -

protocol ShaderProperty {
    var key: String { get }
    var data: Any { get }
}

class ValueProperty<T>: ShaderProperty {
    let key: String
    var data: Any {
        return NSData(bytes: &value, length: MemoryLayout<T>.size)
    }
    
    var value: T
    
    init(key: String, value: T) {
        self.key = key
        self.value = value
    }
}

class TextureProperty: ShaderProperty {
    let key: String
    var data: Any {
        return SCNMaterialProperty(contents: textureName)
    }
    
    var textureName: String
    
    init(key: String, textureName: String) {
        self.key = key
        self.textureName = textureName
    }
}

class TextureListProperty: ShaderProperty {
    let key: String
    var data: Any {
        return SCNMaterialProperty(contents: textureNames)
    }
    
    var textureNames: [String]
    
    init(key: String, textureNames: [String]) {
        self.key = key
        self.textureNames = textureNames
    }
}

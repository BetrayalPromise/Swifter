#if os(iOS)
import Photos

public extension PHAsset {
    /// 容量 单位是字节
    @available(iOS 9, *)
    var volume: Double? {
        let resources: [PHAssetResource] = PHAssetResource.assetResources(for: self)
        guard let size: Double = resources.first?.value(forKey: "fileSize") as? Double else { return nil }
        return size
    }
    
    @available(iOS 9, *)
    var fileName: String? {
        let resources: PHAssetResource? = PHAssetResource.assetResources(for: self).first
        return resources?.originalFilename
    }
}
#endif


import BMPlayer
import SnapKit
import UIKit

class TableVideoViewCell: UITableViewCell {
    
    private var links: String
    private var player = BMPlayer()

    init(links: String) {
        self.links = links
        super.init(style: .default, reuseIdentifier: "cell")
        initialize()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func initialize () {
        player.isUserInteractionEnabled = false
        BMPlayerConf.enableVolumeGestures = false
        BMPlayerConf.enableBrightnessGestures = false
        BMPlayerConf.enablePlaytimeGestures = false
        BMPlayerConf.shouldAutoPlay = true
       let resource = BMPlayerResource(url: URL(string: links)!)
        player.setVideo(resource: resource)
        self.contentView.addSubview(player)
        player.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }
    }
}

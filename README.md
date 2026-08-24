# Booms at Completed 🎵

当 Claude Code 模型输出 EOL token（会话结束）时，自动播放 **creeper 爆炸音效** 💥

## 功能

- 监听 `Stop` hook，在模型完成响应时触发
- 播放 creeper 爆炸音效 (`assets/creeper_booms.mp3`)
- 使用 Windows PresentationCore 播放，无需额外依赖

## 项目结构

```
.
├── .claude-plugin/
│   └── plugin.json          # 插件配置（含 hooks）
├── assets/
│   └── creeper_booms.mp3    # 音效文件
├── play-sound.ps1           # 手动播放脚本
├── test-sound.ps1           # 测试脚本
├── README.md
└── LICENSE
```

## 安装

将本目录放置在项目的 `.claude-plugin/` 下，Claude Code 会自动加载插件。

## 测试

运行测试脚本验证音频播放功能：

```powershell
powershell -ExecutionPolicy Bypass -File .\test-sound.ps1
```

## 工作原理

插件通过 Claude Code 的 `Stop` hook 机制工作：

1. 模型完成响应（输出 EOL token）
2. Claude Code 触发 `Stop` hook
3. Hook 执行 PowerShell 命令，使用 `System.Windows.Media.MediaPlayer` 播放 MP3
4. 播放在后台 Job 中执行，不阻塞 Claude Code

## 注意事项

- 仅支持 Windows 平台（依赖 PresentationCore）
- 需要 PowerShell 5.0+
- 音效文件约 321 KB
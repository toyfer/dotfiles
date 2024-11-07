# = comment
## = debug statement

# work directory
cd "$env:USERPROFILE"

# app path
$enviroment = "$env:USERPROFILE\.app"

# import config file
$enviroment = "$env:USERPROFILE\.conf\pwsh\config.json"

# environment variables
Set-Alias which -Value Get-Command
foreach ($e in $config.apppaths.PSObject.Properties) {
    Set-Alias $($e.Name) -Value "$envitonment$($e.Value)"
}

# tab complete
Set-PSReadLineOption -HistorySaveStyle SaveIncrementally
Set-PSReadLineKeyHandler -Key tab -function MenuComplete

# edit prompt
function Prompt {
    # プロンプト文字列を定義
    $promptString = "PWSH " + $(Get-Location) + ">"
    $isAdmin = '->'
    # 現在のユーザーが管理者かどうかを判定
    if(([Security.Principal.Windowsprincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([System.Security.Princi
pal.WindowsBuiltinRole] "Administrator"))
    {
        # 管理者の場合は'#'をプロンプト文字列に追加
        $isAdmin = '->#'
    }
    # Windowsコンソールの場合
    if ( $Host.Name -eq "ConsoleHost" )
    {
        # ユーザー名をDarkCyanで表示
        Write-Host ("[") -NoNewline -ForegroundColor DarkGray
        Write-Host ($env:username) -NoNewline -ForegroundColor DarkCyan
        write-host ("@") -NoNewline -ForegroundColor DarkGray
        # ホスト名をDarkGreenで表示
        Write-Host (hostname) -NoNewline -ForegroundColor DarkGreen
        Write-Host (" ") -NoNewline -ForegroundColor DarkGray
        # パスをDarkYellowで表示
        Write-Host (shorten-path (pwd).Path) -NoNewline -ForegroundColor DarkYellow
        Write-Host ("]") -NoNewline -ForegroundColor DarkGray
        # 管理者の場合はMagentaで#を表示
        write-host ($isAdmin) -NoNewline -ForegroundColor Cyan
    }
    else {
        Write-Host $promptString -NoNewline
    }

    # プロンプト文字列を返す
    return " "
}
# shorten-path関数を定義
function shorten-path([string]$path) {
    # ホームディレクトリを~に変換
    $loc = $path.Replace($HOME, '～')
    # UNCパスの先頭を削除
    $loc = $loc -replace '^[^:]+::', ''
    # Vimのタブ表示の用にパスを短縮
    # \と.から始まるパスを正しく処理
    return ($loc -replace '\\(.?)([^\\])[^\\]*(?=\\)', '$1$2')
}

function reboot() {
    Restart-Computer -Force
}

function screenoff() {
    (Add-Type '[DllImport(\"user32.dll\")]^public static extern int SendMessage(int hWnd, int hMsg, int wParam, int lParam);' -Nam
e a -Pas)::SendMessage(-1,0x0112,0xF170,2)
}

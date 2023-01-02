" Author: Christian Chiarulli <chrisatmachine@gmail.com>

lua << EOF
package.loaded['spacedark'] = nil
package.loaded['spacedark.highlights'] = nil
package.loaded['spacedark.Treesitter'] = nil
package.loaded['spacedark.markdown'] = nil
package.loaded['spacedark.Whichkey'] = nil
package.loaded['spacedark.Git'] = nil
package.loaded['spacedark.LSP'] = nil

require("spacedark")
EOF

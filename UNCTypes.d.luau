type Function = (() -> ())

type Table = {}

-- Drawing
declare class BaseDrawing
	Visible: boolean
	ZIndex: number
	Transparency: number
	Color: Color3
	function Destroy(self): ()
end

declare class Line extends BaseDrawing
	From: Vector2
	To: Vector2
	Thickness: number
end

declare class Text extends BaseDrawing
	Text: string
	TextBounds: Vector2
	Font: number
	Size: number
	Position: Vector2
	Center: boolean
	Outline: boolean
	OutlineColor: Color3
end

declare class Image extends BaseDrawing
	Data: string
	Size: Vector2
	Position: Vector2
	Rounding: number
end

declare class Circle extends BaseDrawing
	NumSides: number
	Radius: number
	Position: Vector2
	Thickness: number
	Filled: boolean
end

declare class Square extends BaseDrawing
	Size: Vector2
	Position: Vector2
	Thickness: number
	Filled: boolean
end

declare class Quad extends BaseDrawing
	PointA: Vector2
	PointB: Vector2
	PointC: Vector2
	PointD: Vector2
	Thickness: number
	Filled: boolean
end

declare class Triangle extends BaseDrawing
	PointA: Vector2
	PointB: Vector2
	PointC: Vector2
	Thickness: number
	Filled: boolean
end

declare Drawing: {
	new: ((type: DrawingType) -> BaseDrawing),
	Fonts: { [string]: number },
}

type Drawing = Line | Text | Image | Circle | Square | Quad | Triangle

type DrawingType = "Line" | "Text" | "Image" | "Circle" | "Square" | "Quad" | "Triangle"

declare function cleardrawcache(): ()
declare function getrenderproperty(drawing: Drawing, property: string): any
declare function isrenderobj(object: any): boolean
declare function setrenderproperty(drawing: Drawing, property: string, value: any): ()

-- WebSocket
declare class WebSocket
	OnMessage: RBXScriptSignal<string>
	OnClose: RBXScriptSignal
	function Send(self, message: string): ()
	function Close(self): ()
end

declare WebSocket: {
	connect: ((url: string) -> WebSocket),
}

-- Cache
declare cache: {
	invalidate: ((object: Instance) -> ()),
	iscached: ((object: Instance) -> boolean),
	replace: ((object: Instance, newObject: Instance) -> ()),
}

declare function cloneref(object: Instance): Instance
declare function compareinstances(a: Instance, b: Instance): boolean

-- Closures
declare function checkcaller(): boolean
declare function clonefunction<T>(func: T): T
declare function getcallingscript(): BaseScript
declare function hookfunction<T>(func: T, hook: Function): T
declare function iscclosure(func: Function): boolean
declare function islclosure(func: Function): boolean
declare function isexecutorclosure(func: Function): boolean
declare function loadstring(source: string, chunkname: string?): (Function?, string?)
declare function newcclosure<T>(func: T): T

-- Console
declare function rconsoleclear(): ()
declare function rconsolecreate(): ()
declare function rconsoledestroy(): ()
declare function rconsoleinput(): string
declare function rconsoleprint(text: string): ()
declare function rconsolesettitle(title: string): ()

-- Crypt
declare crypt: {
	base64encode: ((data: string) -> string),
	base64decode: ((data: string) -> string),
	encrypt: ((data: string, key: string, iv: string?, mode: Cipher?) -> (string, string)),
	decrypt: ((data: string, key: string, iv: string, mode: Cipher?) -> string),
	generatebytes: ((size: number) -> string),
	generatekey: (() -> string),
	hash: ((data: string, algorithm: HashAlgorithm) -> string),
}

type Cipher = "CBC" | "ECB" | "CTR" | "CFB" | "OFB" | "GCM"

type HashAlgorithm = "sha1" | "sha384" | "sha512" | "md5" | "sha256" | "sha3-224" | "sha3-256" | "sha3-512"

-- Debug
declare debug: {
	getconstant: ((func: Function | number, index: number) -> any),
	getconstants: ((func: Function | number) -> {any}),
	getinfo: ((func: Function | number) -> DebugInfo),
	getproto: ((func: Function | number, index: number, active: boolean?) -> Function | {Function}),
	getprotos: ((func: Function | number) -> {Function}),
	getstack: ((level: number, index: number?) -> any | {any}),
	getupvalue: ((func: Function | number, index: number) -> any),
	getupvalues: ((func: Function | number) -> {any}),
	setconstant: ((func: Function | number, index: number, value: any) -> ()),
	setstack: ((level: number, index: number, value: any) -> ()),
	setupvalue: ((func: Function | number, index: number, value: any) -> ()),
}

declare class DebugInfo
	source: string
	short_src: string
	func: Function
	what: string
	currentline: number
	name: string
	nups: number
	numparams: number
	is_vararg: number
end

-- Filesystem
declare function readfile(path: string): string
declare function listfiles(path: string): {string}
declare function writefile(path: string, data: string): ()
declare function makefolder(path: string): ()
declare function appendfile(path: string, data: string): ()
declare function isfile(path: string): boolean
declare function isfolder(path: string): boolean
declare function delfile(path: string): ()
declare function delfolder(path: string): ()
declare function loadfile(path: string, chunkname: string?): (Function?, string?)
declare function dofile(path: string): ()

-- Input
declare function isrbxactive(): boolean
declare function mouse1click(): ()
declare function mouse1press(): ()
declare function mouse1release(): ()
declare function mouse2click(): ()
declare function mouse2press(): ()
declare function mouse2release(): ()
declare function mousemoveabs(x: number, y: number): ()
declare function mousemoverel(x: number, y: number): ()
declare function mousescroll(pixels: number): ()

-- Instances
declare function fireclickdetector(object: ClickDetector, distance: number?, event: string?): ()
declare function getcallbackvalue(object: Instance, property: string): Function?
declare function getconnections(signal: RBXScriptSignal): {RBXScriptConnection}
declare function getcustomasset(path: string, noCache: boolean): string
declare function gethiddenproperty(object: Instance, property: string): (any, boolean)
declare function gethui(): Folder
declare function getinstances(): {Instance}
declare function getnilinstances(): {Instance}
declare function isscriptable(object: Instance, property: string): boolean
declare function sethiddenproperty(object: Instance, property: string, value: any): boolean
declare function setrbxclipboard(data: string): boolean
declare function setscriptable(object: Instance, property: string, value: boolean): boolean

-- Metatable
declare function getrawmetatable(object: Table): Table
declare function hookmetamethod(object: Table, method: string, hook: Function): Function
declare function getnamecallmethod(): string
declare function isreadonly(object: Table): boolean
declare function setrawmetatable(object: Table, metatable: Table): ()
declare function setreadonly(object: Table, readonly: boolean): ()

-- Miscellaneous
declare function identifyexecutor(): (string, string)
declare function lz4compress(data: string): string
declare function lz4decompress(data: string, size: number): string
declare function messagebox(text: string, caption: string, flags: number): number
declare function queue_on_teleport(code: string): ()
declare function request(options: HttpRequest): HttpResponse
declare function setclipboard(text: string): ()
declare function setfpscap(fps: number): ()

export type HttpRequest = {
	Url: string,
	Method: Method,
	Body: string?,
	Headers: { [string]: string }?,
	Cookies: { [string]: string }?,
}

declare class HttpResponse
	Body: string
	StatusCode: number
	StatusMessage: string
	Success: boolean
	Headers: { [string]: unknown }
end

type Method = "GET" | "POST" | "PATCH" | "PUT"

-- Scripts
declare function getgc(includeTables: boolean?): {Function | Table} --userdata?
declare function getgenv(): { [string]: any }
declare function getloadedmodules(excludeCore: boolean?): {ModuleScript}
declare function getrenv(): { [string]: any }
declare function getrunningscripts(): {LocalScript | ModuleScript}
declare function getscriptbytecode(script: LocalScript | ModuleScript): string
declare function getscriptclosure(script: LocalScript | ModuleScript): Function
declare function getscripthash(script: LocalScript | ModuleScript): string
declare function getscripts(): {LocalScript | ModuleScript}
declare function getsenv(script: LocalScript | ModuleScript): { [string]: any }
declare function getthreadidentity(): number
declare function setthreadidentity(identity: number): ()

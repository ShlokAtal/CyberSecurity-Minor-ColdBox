
<cfoutput>
	<div class="text-center card shadow-sm bg-light border border-5 border-white">
		<div class="card-body">
			<div>
				<img src="includes/images/ColdBoxLogo2015_300.png"
					class="m-2 mt-2" alt="logo" height="200"/>
			</div>

			<div class="badge bg-info mb-2">
				<strong>#getColdBoxSetting( "version" )# (#getColdBoxSetting( "suffix" )#)</strong>
			</div>

			<h1 class="display-5 fw-bold">#encodeForHTML( prc.welcomeMessage )#</h1>

			<div class="col-lg-6 mx-auto">
				<p class="lead mb-4">
					Welcome to modern ColdFusion (CFML) development.
					You can now start building your application with ease.
				</p>
			</div>
		</div>
	</div>

	<div class="container mb-5">
		<div class="row py-5 row-cols-lg-2 gx-4">
			<div class="col d-flex align-items-start">
				<div class="bg-light text-blue flex-shrink-0 me-3 px-2 fs-2 rounded-circle shadow-sm border border-5 border-white">
					<i class="bi bi-broadcast" aria-hidden="true"></i>
				</div>
				<div>
					<h2 class="text-blue">Event Handlers</h2>
					<p>You can click the following event handlers to execute their default action.</p>
					<div class="list-group">
						<cfloop collection="#getSetting( 'RegisteredHandlers' )#" item="handler">
							<a href="#event.buildLink( handler )#"
								class="list-group-item list-group-item-action d-flex gap-2 py-3"
								title="Run Event">
								<div class="rounded-circle flex-shrink-0 text-success px-1">
									<i class="bi bi-play-btn" aria-hidden="true"></i>
								</div>
								<div class="d-flex gap-2 w-100 justify-content-between">#encodeForHTML( handler )#</div>
							</a>
						</cfloop>
					</div>
				</div>
			</div>

			<div class="col d-flex align-items-start">
				<div class="bg-light text-blue flex-shrink-0 me-3 px-2 fs-2 rounded-circle shadow-sm border border-5 border-white">
					<i class="bi bi-cpu-fill" aria-hidden="true"></i>
				</div>
				<div>
					<h2 class="text-blue">Modules</h2>
					<p>Here are your registered ColdBox modules.</p>
					<div class="list-group">
						<cfloop collection="#getSetting( 'Modules' )#" item="thisModule">
							<a href="#event.buildLink( getModuleConfig( thisModule ).inheritedEntryPoint )#"
								class="list-group-item list-group-item-action d-flex gap-2 py-3"
								title="Run Event">
								<div class="rounded-circle flex-shrink-0 text-success px-1">
									<i class="bi bi-play-btn" aria-hidden="true"></i>
								</div>
								<div class="d-flex gap-2 w-100 justify-content-between">#encodeForHTML( thisModule )#</div>
							</a>
						</cfloop>
					</div>
				</div>
			</div>
		</div>

		<div class="row pb-5 row-cols-lg-2 gx-4">
			<div class="col d-flex align-items-start">
				<div class="bg-light text-blue flex-shrink-0 me-3 px-2 fs-2 rounded-circle shadow-sm border border-5 border-white">
					<i class="bi bi-power" aria-hidden="true"></i>
				</div>
				<div>
					<h2 class="text-blue">Reinitialize ColdBox</h2>
					<p>
						ColdBox caches configuration in memory. After configuration changes,
						reinitialize the framework when needed.
					</p>
					<table class="table table-striped">
						<thead>
							<tr>
								<th>URL Action</th>
								<th width="100">Execute</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><em>?fwreinit=1</em></td>
								<td>
									<a class="btn btn-dark" href="index.cfm?fwreinit=1">
										<i class="bi bi-power" aria-hidden="true"></i> Run
									</a>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>

			<div class="col d-flex align-items-start">
				<div class="bg-light text-blue flex-shrink-0 me-3 px-2 fs-2 rounded-circle shadow-sm border border-5 border-white">
					<i class="bi bi-card-checklist" aria-hidden="true"></i>
				</div>
				<div>
					<h2 class="text-blue">Tests</h2>
					<p>
						Unit and integration tests are available in the tests folder.
						You can use the Test Browser or Test Runner.
					</p>
					<div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
						<a href="/tests/index.cfm" class="btn btn-dark btn-lg"
							role="button" target="_blank" rel="noopener noreferrer">
							<i class="bi bi-binoculars" aria-hidden="true"></i>
							Test Browser
						</a>
						<a href="/tests/runner.cfm" class="btn btn-dark btn-lg"
							role="button" target="_blank" rel="noopener noreferrer">
							<i class="bi bi-activity" aria-hidden="true"></i>
							Test Runner
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</cfoutput>
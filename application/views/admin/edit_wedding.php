<div class="container-fluid">
	<h3><i class="fas fa-edit"></i>  Edit Data Kost</h3>

	<?php foreach ($barang as $brg) : ?>

		<form method="post" action=" <?php echo base_url(). 'admin/data_wedding/update' ?> ">

			<div class="for-group">
				<label>Nama Barang</label>
				<input type="text" name="nama_wo" class="form-control" value=" <?php echo $brg->nama_wo ?> ">
			</div>

			<div class="for-group">
				<label>Keterangan</label>
				<input type="hidden" name="id_wo" class="form-control" value=" <?php echo $brg->id_wo ?> ">
				<input type="text" name="keterangan" class="form-control" value=" <?php echo $brg->keterangan ?> ">
			</div>

			<div class="for-group">
				<label>Kategori</label>
				<input type="text" name="kategori" class="form-control" value=" <?php echo $brg->kategori ?> ">
			</div>

			<div class="for-group">
				<label>Harga</label>
				<input type="text" name="harga" class="form-control" value=" <?php echo $brg->harga ?> ">
			</div>
			
			<div class="for-group">
				<label>Stok</label>
				<input type="text" name="stok" class="form-control" value=" <?php echo $brg->stok ?> ">
			</div><br>
			
			<button type="submit" class="btn btn-info btn-sm">Simpan</button>
		</form>

	<?php endforeach ; ?>
</div>